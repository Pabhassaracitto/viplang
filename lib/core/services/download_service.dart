import 'package:flutter/foundation.dart';

import 'local_file_store.dart';

/// Phân loại nguyên nhân tải thất bại — để UI báo đúng lỗi thay vì
/// luôn báo "lỗi kết nối mạng" của thiết bị.
enum DownloadErrorKind {
  /// Mọi máy chủ đều không kết nối được (DNS/socket) → rất có thể
  /// thiết bị đang mất mạng thật.
  network,

  /// Kết nối được nhưng phản hồi quá chậm (timeout).
  timeout,

  /// Máy chủ phản hồi 404 — file chưa được upload lên máy chủ.
  notFound,

  /// Máy chủ phản hồi lỗi (5xx, 4xx…) — sự cố phía máy chủ dữ liệu.
  serverError,

  /// Không xác định.
  unknown,
}

/// Kết quả chi tiết của một lần tải audio.
class DownloadResult {
  /// Đường dẫn file đã lưu trong máy (null nếu thất bại hoặc trên Web).
  final String? localPath;
  final DownloadErrorKind? error;
  final int? statusCode;

  const DownloadResult({this.localPath, this.error, this.statusCode});

  factory DownloadResult.success(String localPath) =>
      DownloadResult(localPath: localPath);

  factory DownloadResult.failure(DownloadErrorKind error, {int? statusCode}) =>
      DownloadResult(error: error, statusCode: statusCode);

  bool get isSuccess => localPath != null;
}

/// Dịch vụ quản lý việc tải toàn bộ audio về máy.
///
/// Cải tiến v1.2 — kiến trúc mirror có thứ tự ưu tiên:
/// 1. Supabase Storage (nguồn chính).
/// 2. GitHub Releases của repo (mirror dự phòng, xem `tools/upload_audio.sh`).
///
/// Khi mirror ưu tiên lỗi (server chết, DNS mất, timeout, 404…), dịch vụ
/// TỰ ĐỘNG chuyển sang mirror kế tiếp. Lỗi trả về được phân loại
/// [DownloadErrorKind] để UI hiển thị đúng nguyên nhân.
///
/// Trên Web (không có hệ thống file) dịch vụ không tải/lưu gì cả: audio
/// được phát trực tiếp từ các mirror qua [remoteUrlsFor].
class DownloadService {
  DownloadService._();
  static final DownloadService instance = DownloadService._();

  static const int maxRetries = 3;
  static const Duration timeout = Duration(seconds: 30);
  static const int maxConcurrency = 4;

  /// Mirror chính: Supabase Storage (bucket public chứa 52 track nghe).
  /// Override lúc build: `--dart-define=AUDIO_PRIMARY_BASE_URL=...`
  static const String primaryBaseUrl = String.fromEnvironment(
    'AUDIO_PRIMARY_BASE_URL',
    defaultValue:
        'https://nlorlkoeygtllnotzrwz.supabase.co/storage/v1/object/public/viplang',
  );

  /// Mirror dự phòng: GitHub Releases của chính repo này.
  /// Upload file bằng `tools/upload_audio.sh` (xem docs/AUDIO_HOSTING.md).
  /// Override lúc build: `--dart-define=AUDIO_FALLBACK_BASE_URL=...`
  static const String fallbackBaseUrl = String.fromEnvironment(
    'AUDIO_FALLBACK_BASE_URL',
    defaultValue:
        'https://github.com/Pabhassaracitto/viplang/releases/download/audio-v1',
  );

  /// Override danh sách mirror khi viết test (không dùng trong production).
  @visibleForTesting
  List<String>? debugBaseUrls;

  /// Override thư mục lưu file khi viết test.
  @visibleForTesting
  String? debugLocalPath;

  /// Danh sách mirror theo thứ tự ưu tiên (đã chuẩn hoá, bỏ phần tử rỗng).
  List<String> get _baseUrls {
    final raw = debugBaseUrls ?? const [primaryBaseUrl, fallbackBaseUrl];
    return raw
        .map((u) => u.trim())
        .where((u) => u.isNotEmpty)
        .map((u) => u.endsWith('/') ? u.substring(0, u.length - 1) : u)
        .toList();
  }

  /// Thư mục chứa file đã tải (null nếu nền tảng không có hệ thống file).
  Future<String?> get _localPath async {
    final override = debugLocalPath;
    if (override != null) return override;
    return LocalFileStore.documentsPath();
  }

  /// Thư mục chứa toàn bộ MP3 của app (tải từ máy chủ **và** import thủ công).
  /// `null` trên Web.
  Future<String?> get audioDirectoryPath async => _localPath;

  /// Có tải / lưu audio vào máy được không (false trên Web).
  bool get supportsOfflineStorage => LocalFileStore.isSupported;

  /// URL phát trực tiếp của một file theo thứ tự mirror (Supabase → GitHub).
  /// Dùng cho Web, và cũng là danh sách mirror khi tải về máy.
  List<String> remoteUrlsFor(String fileName) => [
    for (final base in _baseUrls) '$base/$fileName',
  ];

  /// Kiểm tra xem file đã được tải về local chưa
  Future<bool> isDownloaded(String fileName) async {
    final path = await _localPath;
    if (path == null) return false;
    return LocalFileStore.exists(joinLocalPath(path, fileName));
  }

  /// Lấy đường dẫn cục bộ (local path) của một file đã tải
  Future<String?> getLocalPathForFile(String fileName) async {
    final path = await _localPath;
    if (path == null) return null;
    return joinLocalPath(path, fileName);
  }

  /// Kiểm tra xem tất cả tracks của một theme đã được tải chưa
  Future<bool> isThemeFullyDownloaded(List<String> fileNames) async {
    for (final name in fileNames) {
      if (!await isDownloaded(name)) return false;
    }
    return true;
  }

  /// Tổng số file audio đã tải + tổng dung lượng (bytes)
  Future<({int fileCount, int totalBytes})> getDownloadedStats() async {
    final path = await _localPath;
    var fileCount = 0;
    var totalBytes = 0;
    if (path == null) return (fileCount: 0, totalBytes: 0);

    for (final filePath in await LocalFileStore.listFilePaths(path)) {
      if (!filePath.endsWith('.mp3')) continue;
      fileCount++;
      totalBytes += await LocalFileStore.length(filePath);
    }
    return (fileCount: fileCount, totalBytes: totalBytes);
  }

  /// Xóa toàn bộ audio đã tải (để tải lại từ đầu)
  Future<int> deleteAllAudio() async {
    final path = await _localPath;
    if (path == null) return 0;

    var deleted = 0;
    for (final filePath in await LocalFileStore.listFilePaths(path)) {
      if (!filePath.endsWith('.mp3')) continue;
      await LocalFileStore.delete(filePath);
      deleted++;
    }
    return deleted;
  }

  /// Mô tả lỗi thành thông điệp thân thiện để hiển thị trên UI.
  static String describeError(DownloadErrorKind kind, {int? statusCode}) =>
      switch (kind) {
        DownloadErrorKind.network =>
          'Không kết nối được máy chủ dữ liệu. Vui lòng kiểm tra kết nối mạng của bạn.',
        DownloadErrorKind.timeout =>
          'Kết nối quá chậm hoặc máy chủ đang bận. Vui lòng thử lại sau ít phút.',
        DownloadErrorKind.notFound =>
          'Audio bài này chưa có sẵn trên máy chủ. Vui lòng thử lại sau.',
        DownloadErrorKind.serverError =>
          'Máy chủ dữ liệu đang gặp sự cố${statusCode != null ? ' (mã $statusCode)' : ''}. Vui lòng thử lại sau.',
        DownloadErrorKind.unknown =>
          'Tải file học thất bại. Vui lòng thử lại sau.',
      };

  /// Gộp lỗi của nhiều mirror thành 1 nguyên nhân chính:
  /// - Chỉ khi TẤT CẢ mirror đều lỗi socket/DNS → kết luận mất mạng thiết bị.
  /// - Nếu có ít nhất 1 máy chủ phản hồi HTTP → kết nối mạng ổn, lỗi
  ///   thuộc về phía máy chủ (bảo trì / chưa upload file).
  @visibleForTesting
  static DownloadErrorKind combineErrors(List<DownloadErrorKind> kinds) {
    if (kinds.isEmpty) return DownloadErrorKind.unknown;

    if (kinds.every((k) => k == DownloadErrorKind.network)) {
      return DownloadErrorKind.network;
    }

    final answered = kinds.where(
      (k) =>
          k == DownloadErrorKind.notFound || k == DownloadErrorKind.serverError,
    );
    if (answered.isNotEmpty) {
      if (answered.contains(DownloadErrorKind.serverError)) {
        return DownloadErrorKind.serverError;
      }
      return DownloadErrorKind.notFound;
    }

    if (kinds.contains(DownloadErrorKind.timeout)) {
      return DownloadErrorKind.timeout;
    }
    return DownloadErrorKind.unknown;
  }

  /// Tải một file audio (API cũ, giữ tương thích).
  /// Trả về đường dẫn file hoặc null nếu thất bại — dùng [downloadAudioDetailed]
  /// để biết lý do.
  Future<String?> downloadAudio(
    String fileName, {
    int retries = maxRetries,
  }) async {
    final result = await downloadAudioDetailed(fileName, retries: retries);
    return result.localPath;
  }

  /// Tải một file audio theo thứ tự ưu tiên mirror:
  /// thử hết mirror chính (có retry) rồi mới chuyển sang mirror dự phòng.
  Future<DownloadResult> downloadAudioDetailed(
    String fileName, {
    int retries = maxRetries,
  }) async {
    // File đã có sẵn (và không rỗng) → không cần mạng
    final existing = await _existingFile(fileName);
    if (existing != null) return DownloadResult.success(existing);

    // Web: không có nơi lưu file → không tải (audio được phát trực tiếp).
    if (!supportsOfflineStorage) {
      return DownloadResult.failure(DownloadErrorKind.unknown);
    }

    final mirrors = _baseUrls;
    if (mirrors.isEmpty) {
      return DownloadResult.failure(DownloadErrorKind.unknown);
    }

    final failures = <DownloadErrorKind>[];
    int? lastStatus;

    for (var mi = 0; mi < mirrors.length; mi++) {
      final baseUrl = mirrors[mi];
      var lastKind = DownloadErrorKind.unknown;

      for (var attempt = 1; attempt <= retries; attempt++) {
        final r = await _downloadOnce(baseUrl, fileName);
        if (r.localPath != null) {
          debugPrint('✅ Đã tải: $fileName (mirror ${mi + 1}/${mirrors.length})');
          return DownloadResult.success(r.localPath!);
        }

        lastKind = r.error ?? DownloadErrorKind.unknown;
        if (r.statusCode != null) lastStatus = r.statusCode;

        // Lỗi vĩnh viễn của mirror này (404, sai quyền…) → sang ngay
        // mirror kế tiếp, retry trên cùng mirror chỉ phí công chờ.
        if (r.permanent) break;

        if (attempt < retries) {
          await Future.delayed(Duration(seconds: attempt));
          debugPrint('🔄 Thử lại ($attempt/$retries): $fileName');
        }
      }

      failures.add(lastKind);
      if (mi < mirrors.length - 1) {
        debugPrint(
          '↪️ Mirror ${mi + 1}/${mirrors.length} lỗi ($lastKind) → '
          'chuyển sang mirror dự phòng cho $fileName',
        );
      }
    }

    final kind = combineErrors(failures);
    debugPrint('❌ Tải thất bại $fileName trên mọi mirror: $kind');
    return DownloadResult.failure(kind, statusCode: lastStatus);
  }

  Future<String?> _existingFile(String fileName) async {
    final path = await _localPath;
    if (path == null) return null;
    final filePath = joinLocalPath(path, fileName);
    if (await LocalFileStore.exists(filePath) &&
        await LocalFileStore.length(filePath) > 0) {
      return filePath;
    }
    return null;
  }

  /// Một lượt GET duy nhất tới [baseUrl]/[fileName].
  Future<({String? localPath, DownloadErrorKind? error, int? statusCode, bool permanent})>
  _downloadOnce(String baseUrl, String fileName) async {
    final path = await _localPath;
    if (path == null) {
      return (
        localPath: null,
        error: DownloadErrorKind.unknown,
        statusCode: null,
        permanent: true,
      );
    }
    final filePath = joinLocalPath(path, fileName);

    final url = '$baseUrl/$fileName';
    final r = await LocalFileStore.httpGet(url, timeout: timeout);

    if (r.statusCode == 200 && r.bytes != null) {
      final bytes = r.bytes!;
      if (bytes.isEmpty) {
        debugPrint('❌ File rỗng: $fileName ($baseUrl)');
        return (
          localPath: null,
          error: DownloadErrorKind.serverError,
          statusCode: 200,
          permanent: true,
        );
      }
      try {
        await LocalFileStore.write(filePath, bytes);
      } catch (e) {
        debugPrint('❌ Không ghi được $fileName: $e');
        return (
          localPath: null,
          error: DownloadErrorKind.unknown,
          statusCode: 200,
          permanent: false,
        );
      }
      return (
        localPath: filePath,
        error: null,
        statusCode: 200,
        permanent: false,
      );
    }

    final status = r.statusCode;
    if (status != null) {
      debugPrint('❌ Lỗi tải $fileName từ $baseUrl — HTTP $status');
      return (
        localPath: null,
        error: _kindFromStatus(status),
        statusCode: status,
        permanent: _isPermanentStatus(status),
      );
    }

    // Không nhận được phản hồi HTTP nào.
    final failure = r.failure ?? FetchFailure.other;
    if (failure == FetchFailure.network) {
      // DNS không phân giải / không route / connection refused —
      // máy chủ chết hoặc thiết bị mất mạng (phân biệt ở combineErrors).
      debugPrint('❌ Không kết nối được $baseUrl cho $fileName');
      return (
        localPath: null,
        error: DownloadErrorKind.network,
        statusCode: null,
        permanent: false,
      );
    }
    if (failure == FetchFailure.timeout) {
      debugPrint('❌ Timeout tải $fileName từ $baseUrl');
      return (
        localPath: null,
        error: DownloadErrorKind.timeout,
        statusCode: null,
        permanent: false,
      );
    }
    debugPrint('❌ Lỗi tải file $fileName từ $baseUrl');
    return (
      localPath: null,
      error: DownloadErrorKind.unknown,
      statusCode: null,
      permanent: false,
    );
  }

  static DownloadErrorKind _kindFromStatus(int status) {
    if (status == 404) return DownloadErrorKind.notFound;
    return DownloadErrorKind.serverError;
  }

  /// 404 / 4xx (trừ 408, 429) là "chắc chắn không tải được ở mirror này"
  /// → bỏ retry, chuyển mirror ngay. 5xx/429/408 là lỗi tạm → còn retry.
  static bool _isPermanentStatus(int status) {
    if (status == 408 || status == 429) return false;
    return status >= 400 && status < 500;
  }

  /// Tải hàng loạt file (song song giới hạn [maxConcurrency]).
  ///
  /// [onProgress] nhận (current, total) hoặc double 0..1 (tương thích cũ).
  /// Trả về true CHỈ KHI tất cả file tải thành công.
  Future<bool> downloadMultiple(
    List<String> fileNames, {
    dynamic onProgress,
    int concurrency = maxConcurrency,
  }) async {
    final total = fileNames.length;
    if (total == 0) return true;

    int completed = 0;
    int successCount = 0;

    void notifyProgress() {
      if (onProgress == null) return;
      try {
        onProgress(completed, total);
      } catch (_) {
        try {
          onProgress(completed / total);
        } catch (_) {}
      }
    }

    // Hàng đợi work-stealing đơn giản với N worker
    final iterator = fileNames.iterator;
    Future<void> worker() async {
      while (true) {
        String? name;
        // iterator không thread-safe nhưng Dart single-threaded → an toàn
        if (!iterator.moveNext()) break;
        name = iterator.current;

        final localPath = await downloadAudio(name);
        if (localPath != null) successCount++;
        completed++;
        notifyProgress();
      }
    }

    final workers = List.generate(
      concurrency.clamp(1, total),
      (_) => worker(),
    );
    await Future.wait(workers);

    final allOk = successCount == total;
    if (!allOk) {
      debugPrint('⚠️ downloadMultiple: $successCount/$total file OK');
    }
    return allOk;
  }
}
