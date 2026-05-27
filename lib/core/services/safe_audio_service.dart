import 'dart:io';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'audio_path_resolver.dart';

/// Lớp bọc an toàn để xử lý audio logic.
/// Đảm bảo kiểm tra file ở cả Assets và Local Storage.
class SafeAudioService {
  SafeAudioService._();
  static final SafeAudioService instance = SafeAudioService._();

  /// Nạp nguồn âm thanh vào player một cách an toàn
  Future<void> preparePlayer(
    AudioPlayer player,
    String themeId,
    int trackNum,
  ) async {
    final path = await AudioPathResolver.instance.getListeningPath(
      themeId,
      trackNum,
    );

    // 1. Kiểm tra nếu là đường dẫn local (từ path_provider)
    if (!path.startsWith('assets/')) {
      final file = File(path);
      if (await file.exists()) {
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

  /// Kiểm tra xem file có sẵn để phát không (Asset hoặc Local)
  Future<bool> isAudioAvailable(String themeId, int trackNum) async {
    final path = await AudioPathResolver.instance.getListeningPath(
      themeId,
      trackNum,
    );

    if (!path.startsWith('assets/')) {
      return File(path).existsSync();
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
