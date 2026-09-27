import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/services/app_settings.dart';
import '../../../core/services/audio_path_resolver.dart';
import '../../../core/services/download_service.dart';
import '../../../core/services/hive_service.dart';
import '../../../core/services/notification_service.dart';
import '../../../core/services/streak_service.dart';
import '../../../data/content/all_themes_registry.dart';
import '../../../data/models/user_progress_model.dart';
import '../../blocs/theme_bloc/theme_bloc.dart';
import '../onboarding/onboarding_screen.dart';

/// Màn Cài đặt: quản lý audio, TTS, tốc độ phát, reset tiến độ.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _ttsEnabled = true;
  double _playbackSpeed = AppConstants.defaultPlaybackSpeed;
  int _audioFileCount = 0;
  int _audioBytes = 0;
  bool _busy = false;
  double _downloadProgress = 0;
  String? _statusMessage;
  UserGoal? _goal;
  int _freezesRemaining = AppConstants.streakFreezeMaxPerWeek;

  @override
  void initState() {
    super.initState();
    _loadSettings();
    _loadAudioStats();
    _loadGoal();
  }

  // ─── Mục tiêu học tập (Giai đoạn 3) ────────────────────────────────────────
  void _loadGoal() {
    try {
      final progress = HiveService.progressBox.get('current_user');
      final rawWeekStart = HiveService.settingsBox.get(
        'streak_freeze_week_start',
      );
      _goal = progress?.goal;
      _freezesRemaining = StreakService.freezesRemaining(
        now: DateTime.now(),
        freezesUsedThisWeek: progress?.streakFreezesUsedThisWeek ?? 0,
        freezeWeekStart: rawWeekStart is DateTime ? rawWeekStart : null,
      );
    } catch (e) {
      debugPrint('⚠️ Không đọc được mục tiêu: $e');
    }
  }

  Future<void> _editGoal() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OnboardingScreen(initialGoal: _goal, isEditing: true),
      ),
    );
    if (!mounted) return;
    setState(_loadGoal);
  }

  // ─── Nhắc học (local notification, Giai đoạn 3) ───────────────────────────
  Future<void> _toggleReminder(bool enabled) async {
    final settings = AppSettings.instance;

    if (!enabled) {
      await settings.setReminderEnabled(false);
      await NotificationService.instance.cancelDailyReminder();
      if (mounted) setState(() {});
      return;
    }

    final granted = await NotificationService.instance.requestPermission();
    if (!granted) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Cần cho phép thông báo để bật nhắc học (Cài đặt hệ thống → Thông báo).',
          ),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final ok = await NotificationService.instance.scheduleDailyReminderAt(
      settings.reminderTime,
    );
    await settings.setReminderEnabled(ok);

    if (!mounted) return;
    setState(() {});
    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thiết bị này không hẹn được thông báo.'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  Future<void> _pickReminderTime() async {
    final settings = AppSettings.instance;
    final picked = await showTimePicker(
      context: context,
      initialTime: settings.reminderTime,
      helpText: 'Chọn giờ nhắc học',
    );
    if (picked == null) return;

    await settings.setReminderTime(picked.hour, picked.minute);
    if (settings.reminderEnabled) {
      await NotificationService.instance.scheduleDailyReminderAt(picked);
    }
    if (mounted) setState(() {});
  }

  String _goalSummary() {
    final goal = _goal;
    if (goal == null) return 'Chưa đặt';
    final daysLeft = goal.targetDate.difference(DateTime.now()).inDays;
    final suffix = daysLeft > 0 ? ' · còn $daysLeft ngày' : '';
    return 'TOEIC ${goal.targetScore}+ · ${goal.dailyMinutes} phút/ngày$suffix';
  }

  Future<void> _loadSettings() async {
    final box = HiveService.settingsBox;
    setState(() {
      _ttsEnabled = box.get('tts_enabled', defaultValue: true) as bool;
      _playbackSpeed = (box.get(
        'playback_speed',
        defaultValue: AppConstants.defaultPlaybackSpeed,
      ) as num)
          .toDouble();
    });
  }

  Future<void> _loadAudioStats() async {
    final stats = await DownloadService.instance.getDownloadedStats();
    if (mounted) {
      setState(() {
        _audioFileCount = stats.fileCount;
        _audioBytes = stats.totalBytes;
      });
    }
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  List<String> _allAudioFileNames() {
    final files = <String>{};
    for (final theme in AllThemesRegistry.getAllThemes()) {
      files.addAll(
        AudioPathResolver.instance.getAllFileNamesForTheme(theme.id),
      );
    }
    return files.toList();
  }

  Future<void> _redownloadMissing() async {
    if (_busy) return;
    setState(() {
      _busy = true;
      _downloadProgress = 0;
      _statusMessage = 'Đang kiểm tra file thiếu...';
    });

    try {
      final allFiles = _allAudioFileNames();
      final missing = <String>[];
      for (final name in allFiles) {
        if (!await DownloadService.instance.isDownloaded(name)) {
          missing.add(name);
        }
      }

      if (missing.isEmpty) {
        setState(() {
          _busy = false;
          _statusMessage = 'Tất cả audio đã đầy đủ.';
        });
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) setState(() => _statusMessage = null);
        return;
      }

      setState(() {
        _statusMessage = 'Đang tải ${missing.length} file còn thiếu...';
      });

      final ok = await DownloadService.instance.downloadMultiple(
        missing,
        onProgress: (double p) {
          if (mounted) setState(() => _downloadProgress = p);
        },
      );

      await HiveService.settingsBox.put('full_audio_downloaded', ok);
      await _loadAudioStats();

      setState(() {
        _busy = false;
        _statusMessage = ok
            ? 'Tải lại hoàn tất!'
            : 'Một số file vẫn lỗi. Thử lại khi có mạng tốt hơn.';
      });
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) setState(() => _statusMessage = null);
    } catch (e) {
      setState(() {
        _busy = false;
        _statusMessage = 'Lỗi: $e';
      });
    }
  }

  Future<void> _redownloadAll() async {
    if (_busy) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusL),
        ),
        title: const Text('Tải lại toàn bộ audio?'),
        content: const Text(
          'Toàn bộ file audio đã tải sẽ bị xóa và tải lại từ đầu. '
          'Cần kết nối mạng ổn định.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Tải lại', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() {
      _busy = true;
      _downloadProgress = 0;
      _statusMessage = 'Đang xóa file cũ...';
    });

    try {
      await DownloadService.instance.deleteAllAudio();
      final allFiles = _allAudioFileNames();

      setState(() => _statusMessage = 'Đang tải lại toàn bộ...');
      final ok = await DownloadService.instance.downloadMultiple(
        allFiles,
        onProgress: (double p) {
          if (mounted) setState(() => _downloadProgress = p);
        },
      );

      await HiveService.settingsBox.put('full_audio_downloaded', ok);
      await _loadAudioStats();

      setState(() {
        _busy = false;
        _statusMessage = ok ? 'Tải lại hoàn tất!' : 'Có file tải lỗi, thử lại sau.';
      });
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) setState(() => _statusMessage = null);
    } catch (e) {
      setState(() {
        _busy = false;
        _statusMessage = 'Lỗi: $e';
      });
    }
  }

  Future<void> _resetProgress() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusL),
        ),
        title: const Text('Xóa toàn bộ tiến độ?'),
        content: const Text(
          'Streak, XP, badge, tiến độ 13 chủ đề và lịch ôn SRS sẽ bị xóa. '
          'Không thể hoàn tác.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Xóa', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    try {
      // 1. Reset tiến độ — dùng clear() thay vì deleteFromDisk()
      //    (deleteFromDisk đóng box → HiveService getters sẽ throw)
      await HiveService.progressBox.clear();
      // 2. Reset theme progress → ThemeBloc sẽ seed lại từ Registry
      await HiveService.themeBox.clear();
      // 3. Reset SRS trên vocab (giữ từ, chỉ xóa lịch ôn)
      final vocabBox = HiveService.vocabBox;
      for (final vocab in vocabBox.values) {
        vocab.repetitionCount = 0;
        vocab.easeFactor = AppConstants.defaultEaseFactor;
        vocab.intervalDays = 0;
        vocab.nextReview = null;
        await vocab.save();
      }

      // Seed lại theme vào box
      if (mounted) {
        context.read<ThemeBloc>().add(LoadThemesEvent());
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đã xóa tiến độ học. Chào mừng bắt đầu lại!'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi reset: $e'), backgroundColor: AppColors.error),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Cài đặt', style: AppTextStyles.h2),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.paddingM),
        children: [
          // ── Giao diện (sáng / tối / theo hệ thống) ──
          const _SectionTitle('Giao diện'),
          _Card(
            child: ListenableBuilder(
              listenable: AppSettings.instance,
              builder: (context, _) {
                final current = AppSettings.instance.themeMode;
                return Column(
                  children: [
                    for (final mode in AppThemeMode.values) ...[
                      if (mode != AppThemeMode.values.first)
                        Divider(height: 1, color: AppColors.divider),
                      _ThemeModeTile(
                        mode: mode,
                        selected: current == mode,
                        onTap: () => AppSettings.instance.setThemeMode(mode),
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: AppConstants.paddingL),

          // ── Audio ──
          const _SectionTitle('Dữ liệu âm thanh'),
          _Card(
            child: Column(
              children: [
                _InfoRow(
                  icon: Icons.storage_rounded,
                  label: 'Đã tải',
                  value: '$_audioFileCount file · ${_formatBytes(_audioBytes)}',
                ),
                Divider(height: 1, color: AppColors.divider),
                if (_busy) ...[
                  const SizedBox(height: AppConstants.paddingM),
                  LinearProgressIndicator(
                    value: _downloadProgress > 0 ? _downloadProgress : null,
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(3),
                    backgroundColor: AppColors.border,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingS),
                  Text(
                    _statusMessage ?? '',
                    style: AppTextStyles.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppConstants.paddingM),
                ] else if (_statusMessage != null) ...[
                  const SizedBox(height: AppConstants.paddingS),
                  Text(
                    _statusMessage!,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.success,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppConstants.paddingS),
                ],
                _ActionRow(
                  icon: Icons.download_rounded,
                  label: 'Tải lại file còn thiếu',
                  onTap: _redownloadMissing,
                  enabled: !_busy,
                ),
                Divider(height: 1, color: AppColors.divider),
                _ActionRow(
                  icon: Icons.refresh_rounded,
                  label: 'Tải lại toàn bộ audio',
                  onTap: _redownloadAll,
                  enabled: !_busy,
                  danger: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppConstants.paddingL),

          // ── Phát âm ──
          const _SectionTitle('Phát âm'),
          _Card(
            child: Column(
              children: [
                SwitchListTile(
                  value: _ttsEnabled,
                  onChanged: (v) async {
                    setState(() => _ttsEnabled = v);
                    await HiveService.settingsBox.put('tts_enabled', v);
                  },
                  title: const Text('Đọc từ bằng TTS'),
                  subtitle: Text(
                    'Tắt để chỉ phát audio bài học có sẵn',
                    style: AppTextStyles.bodySmall,
                  ),
                  activeColor: AppColors.primary, // ignore: deprecated_member_use
                ),
                Divider(height: 1, color: AppColors.divider),
                ListTile(
                  title: const Text('Tốc độ phát mặc định'),
                  trailing: DropdownButton<double>(
                    value: _playbackSpeed,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(value: 0.75, child: Text('0.75× (chậm)')),
                      DropdownMenuItem(value: 1.0, child: Text('1.0×')),
                      DropdownMenuItem(value: 1.25, child: Text('1.25×')),
                      DropdownMenuItem(value: 1.5, child: Text('1.5× (nhanh)')),
                    ],
                    onChanged: (v) async {
                      if (v == null) return;
                      setState(() => _playbackSpeed = v);
                      await HiveService.settingsBox.put('playback_speed', v);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppConstants.paddingL),

          // ── Mục tiêu ──
          const _SectionTitle('Mục tiêu học tập'),
          _Card(
            child: Column(
              children: [
                _InfoRow(
                  icon: Icons.flag_rounded,
                  label: 'Mục tiêu hiện tại',
                  value: _goalSummary(),
                ),
                Divider(height: 1, color: AppColors.divider),
                _InfoRow(
                  icon: Icons.ac_unit_rounded,
                  label: 'Đóng băng streak còn lại',
                  value: '$_freezesRemaining lượt tuần này',
                ),
                Divider(height: 1, color: AppColors.divider),
                _ActionRow(
                  icon: Icons.edit_rounded,
                  label: _goal == null
                      ? 'Đặt mục tiêu học tập'
                      : 'Sửa mục tiêu học tập',
                  onTap: _editGoal,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppConstants.paddingL),

          // ── Nhắc học ──
          const _SectionTitle('Nhắc học'),
          _Card(
            child: ListenableBuilder(
              listenable: AppSettings.instance,
              builder: (context, _) {
                final settings = AppSettings.instance;
                return Column(
                  children: [
                    SwitchListTile(
                      value: settings.reminderEnabled,
                      onChanged: NotificationService.isSupportedPlatform
                          ? _toggleReminder
                          : null,
                      // ignore: deprecated_member_use
                      activeColor: AppColors.primary,
                      title: Text(
                        'Nhắc học mỗi ngày',
                        style: AppTextStyles.bodyMedium,
                      ),
                      subtitle: Text(
                        NotificationService.isSupportedPlatform
                            ? (settings.reminderEnabled
                                  ? 'Thông báo lúc ${settings.reminderTimeLabel}'
                                  : 'Bật để không quên học và mất streak')
                            : 'Chỉ hỗ trợ trên Android / iOS',
                        style: AppTextStyles.bodySmall,
                      ),
                    ),
                    if (settings.reminderEnabled &&
                        NotificationService.isSupportedPlatform) ...[
                      Divider(height: 1, color: AppColors.divider),
                      _ActionRow(
                        icon: Icons.schedule_rounded,
                        label: 'Đổi giờ nhắc (${settings.reminderTimeLabel})',
                        onTap: _pickReminderTime,
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: AppConstants.paddingL),

          // ── Dữ liệu ──
          const _SectionTitle('Dữ liệu học tập'),
          _Card(
            child: _ActionRow(
              icon: Icons.delete_forever_rounded,
              label: 'Xóa toàn bộ tiến độ học',
              onTap: _resetProgress,
              danger: true,
            ),
          ),
          const SizedBox(height: AppConstants.paddingL),

          // ── Về app ──
          const _SectionTitle('Về ứng dụng'),
          _Card(
            child: Column(
              children: [
                _InfoRow(
                  icon: Icons.info_outline_rounded,
                  label: 'Phiên bản',
                  value: 'VipLang ${AppConstants.appVersion}',
                ),
                Divider(height: 1, color: AppColors.divider),
                _InfoRow(
                  icon: Icons.menu_book_rounded,
                  label: 'Nội dung',
                  value: '${AppConstants.totalThemes} chủ đề TOEIC',
                ),
              ],
            ),
          ),
          const SizedBox(height: AppConstants.paddingXL),
        ],
      ),
    );
  }
}

// ─── UI helpers ──────────────────────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppConstants.paddingXS,
        bottom: AppConstants.paddingS,
      ),
      child: Text(text, style: AppTextStyles.labelMedium),
    );
  }
}

class _Card extends StatelessWidget {
  final Widget child;
  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _ThemeModeTile extends StatelessWidget {
  final AppThemeMode mode;
  final bool selected;
  final VoidCallback onTap;

  const _ThemeModeTile({
    required this.mode,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        mode.icon,
        color: selected ? AppColors.primary : AppColors.textTertiary,
        size: 22,
      ),
      title: Text(
        mode.label,
        style: AppTextStyles.bodyMedium.copyWith(
          color: selected ? AppColors.primary : AppColors.textPrimary,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
      trailing: selected
          ? const Icon(Icons.check_circle_rounded, color: AppColors.primary)
          : Icon(
              Icons.circle_outlined,
              color: AppColors.textDisabled,
              size: 20,
            ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary, size: 22),
      title: Text(label, style: AppTextStyles.bodyMedium),
      trailing: Text(
        value,
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool enabled;
  final bool danger;

  const _ActionRow({
    required this.icon,
    required this.label,
    required this.onTap,
    this.enabled = true,
    this.danger = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = danger ? AppColors.error : AppColors.primary;
    return InkWell(
      onTap: enabled ? onTap : null,
      child: Opacity(
        opacity: enabled ? 1 : 0.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingM,
            vertical: AppConstants.paddingS,
          ),
          child: Row(
            children: [
              Icon(icon, color: color, size: 22),
              const SizedBox(width: AppConstants.paddingM),
              Expanded(
                child: Text(
                  label,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: color, size: 22),
            ],
          ),
        ),
      ),
    );
  }
}
