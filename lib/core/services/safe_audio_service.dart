import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

import 'audio_path_resolver.dart';
import 'download_service.dart';
import 'local_file_store.dart';

/// Lớp bọc an toàn để xử lý audio logic.
///
/// Thứ tự nguồn (native): file đã tải/nhập trong máy → asset đóng gói → lỗi.
/// Thứ tự nguồn (Web): phát trực tiếp từ mirror (Supabase → GitHub Releases).
class SafeAudioService {
  SafeAudioService._();
  static final SafeAudioService instance = SafeAudioService._();

  /// Nạp nguồn âm thanh vào player một cách an toàn
  Future<void> preparePlayer(
    AudioPlayer player,
    String themeId,
    int trackNum,
  ) async {
    // Web: không có file cục bộ → stream trực tiếp từ máy chủ.
    if (kIsWeb) {
      final fileName = AudioPathResolver.instance.getFileName(themeId, trackNum);
      await _setStreamingSource(player, fileName);
      return;
    }

    final path = await AudioPathResolver.instance.getListeningPath(
      themeId,
      trackNum,
    );

    // 1. Kiểm tra nếu là đường dẫn local (từ path_provider)
    if (!path.startsWith('assets/')) {
      if (await LocalFileStore.exists(path)) {
        await player.setFilePath(path);
        return;
      }
    }

    // 2. Nếu không có local, thử Asset
    try {
      // Kiểm tra file có trong asset không trước khi set
      final data = await rootBundle.load(path);
      if (data.lengthInBytes > 0) {
        final bytes = data.buffer.asUint8List(
          0,
          data.lengthInBytes < 100 ? data.lengthInBytes : 100,
        );
        final firstChars = String.fromCharCodes(bytes).toLowerCase();
        if (firstChars.contains('<!doctype') || firstChars.contains('<html')) {
          throw Exception(
            'Asset fallback detected: HTML page returned instead of audio',
          );
        }
      }
      await player.setAsset(path);
    } catch (e) {
      // 3. Nếu cả 2 đều không có, ném lỗi để UI xử lý (hiện nút download on-demand)
      throw Exception('Audio file NOT found: $path');
    }
  }

  /// Phát trực tiếp từ URL, thử lần lượt từng mirror (Supabase → GitHub).
  /// Thẻ `<audio>` của trình duyệt phát được cross-origin nên không cần CORS.
  Future<void> _setStreamingSource(AudioPlayer player, String fileName) async {
    Object? lastError;
    for (final url in DownloadService.instance.remoteUrlsFor(fileName)) {
      try {
        await player.setUrl(url);
        return;
      } catch (e) {
        lastError = e;
        debugPrint('⚠️ Không phát được $url: $e');
      }
    }
    throw Exception('Audio file NOT found: $fileName (${lastError ?? 'không có mirror'})');
  }

  /// Kiểm tra xem file có sẵn để phát không (Asset hoặc Local)
  Future<bool> isAudioAvailable(String themeId, int trackNum) async {
    // Web: sẵn sàng nếu track nằm trong danh sách file trên máy chủ.
    if (kIsWeb) {
      final fileName = AudioPathResolver.instance.getFileName(themeId, trackNum);
      return AudioPathResolver.instance.isServerFileAvailable(fileName);
    }

    final path = await AudioPathResolver.instance.getListeningPath(
      themeId,
      trackNum,
    );

    if (!path.startsWith('assets/')) {
      return LocalFileStore.exists(path);
    }

    return isAssetAvailable(path);
  }

  /// Kiểm tra trực tiếp đường dẫn asset có hợp lệ và tồn tại không
  Future<bool> isAssetAvailable(String path) async {
    try {
      final data = await rootBundle.load(path);
      if (data.lengthInBytes > 0) {
        final bytes = data.buffer.asUint8List(
          0,
          data.lengthInBytes < 100 ? data.lengthInBytes : 100,
        );
        final firstChars = String.fromCharCodes(bytes).toLowerCase();
        if (firstChars.contains('<!doctype') || firstChars.contains('<html')) {
          return false;
        }
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}
