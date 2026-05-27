// lib/presentation/screens/splash_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/services/audio_path_resolver.dart';
import '../../core/services/download_service.dart';
import '../../core/services/hive_service.dart';
import '../../data/content/all_themes_registry.dart';
import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progress = 0;
  String _statusMessage = 'Đang khởi tạo...';
  bool _isDownloading = false;
  bool _showDownloadSelection = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // 1. Chờ 1 chút để logo hiện ra mượt
    await Future.delayed(2.seconds);

    // 2. Init AudioPathResolver (lấy docs path)
    setState(() => _statusMessage = 'Đang kiểm tra dữ liệu âm thanh...');
    await AudioPathResolver.instance.init();

    // 3. Kiểm tra xem đã tải toàn bộ hoặc đã quyết định chọn tải thủ công trước đó chưa
    final settingsBox = HiveService.settingsBox;
    final isFullDownloaded = settingsBox.get(
      'full_audio_downloaded',
      defaultValue: false,
    );
    final skipDownload = settingsBox.get(
      'skip_initial_download',
      defaultValue: false,
    );

    if (isFullDownloaded || skipDownload) {
      _goToHome();
      return;
    }

    // 4. Lần đầu mở app: Hiển thị giao diện lựa chọn download để bảo vệ dung lượng người dùng
    setState(() {
      _showDownloadSelection = true;
      _statusMessage =
          'Dữ liệu âm thanh luyện nghe chất lượng cao chưa được tải.';
    });
  }

  Future<void> _startFirstRunDownload() async {
    setState(() {
      _showDownloadSelection = false;
      _isDownloading = true;
      _statusMessage = 'Đang tải dữ liệu bài học lần đầu...';
    });

    final themes = AllThemesRegistry.getAllThemes();
    final List<String> filesToDownload = [];

    for (final theme in themes) {
      filesToDownload.addAll(
        AudioPathResolver.instance.getAllFileNamesForTheme(theme.id),
      );
    }

    try {
      await DownloadService.instance.downloadMultiple(
        filesToDownload,
        onProgress: (p) {
          setState(() {
            _progress = p;
            _statusMessage = 'Đang tải tài nguyên: ${(p * 100).toInt()}%';
          });
        },
      );

      // Lưu flag đã tải xong
      await HiveService.settingsBox.put('full_audio_downloaded', true);
      await HiveService.settingsBox.put('skip_initial_download', false);

      setState(() => _statusMessage = 'Đã hoàn tất tải dữ liệu!');
      await Future.delayed(1.seconds);
      _goToHome();
    } catch (e) {
      debugPrint('Error downloading all: $e');
      setState(
        () => _statusMessage =
            'Có lỗi khi tải dữ liệu. Bạn có thể tải sau trong bài học.',
      );
      await Future.delayed(2.seconds);
      _goToHome();
    }
  }

  Future<void> _skipAndManualDownload() async {
    await HiveService.settingsBox.put('skip_initial_download', true);
    await HiveService.settingsBox.put('full_audio_downloaded', false);
    _goToHome();
  }

  void _goToHome() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo / App Icon
            Image.asset(
              'assets/images/logo_viplang.png',
              width: 150,
            ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),

            const SizedBox(height: 32),

            Text(
              'VIPLANG',
              style: AppTextStyles.h1.copyWith(
                letterSpacing: 4,
                color: AppColors.primary,
              ),
            ).animate().fadeIn(delay: 300.ms),

            const SizedBox(height: 8),

            Text(
              'Chinh phục tiếng Anh công sở',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ).animate().fadeIn(delay: 500.ms),

            const SizedBox(height: 48),

            if (_isDownloading) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppConstants.radiusS),
                      child: LinearProgressIndicator(
                        value: _progress,
                        backgroundColor: AppColors.primary.withValues(
                          alpha: 0.1,
                        ),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                        minHeight: 6,
                      ),
                    ),
                    const SizedBox(height: AppConstants.paddingM),
                    Text(
                      _statusMessage,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ).animate().fadeIn(),
            ] else if (_showDownloadSelection) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    Text(
                      'Tùy chọn tải dữ liệu luyện nghe',
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Để nghe mượt mà nhất, hãy tải trước toàn bộ audio (khuyên dùng Wifi). Nếu bạn dùng mạng di động (3G/4G) hoặc bộ nhớ máy thấp, bạn có thể tải thủ công từng bài học sau.',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Nút tải toàn bộ
                    ElevatedButton.icon(
                      onPressed: _startFirstRunDownload,
                      icon: const Icon(
                        Icons.download_for_offline_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: const Text(
                        'Tải xuống toàn bộ (Khuyên dùng)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusM,
                          ),
                        ),
                        elevation: 1,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Nút tải thủ công / bỏ qua
                    OutlinedButton.icon(
                      onPressed: _skipAndManualDownload,
                      icon: const Icon(
                        Icons.touch_app_rounded,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      label: const Text(
                        'Tải thủ công sau (Vào học ngay)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: const BorderSide(
                          color: AppColors.primary,
                          width: 1.5,
                        ),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusM,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(),
            ] else ...[
              const CircularProgressIndicator(
                strokeWidth: 3,
                color: AppColors.primary,
              ).animate().fadeIn(delay: 200.ms),
              const SizedBox(height: AppConstants.paddingM),
              Text(
                _statusMessage,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
