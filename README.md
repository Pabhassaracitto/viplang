# VIPLANG — Học tiếng Anh theo phương pháp Do Thái

**VipLang** là app Flutter học tiếng Anh giao tiếp công sở / workplace theo **13 chủ đề TOEIC**, thiết kế theo phương pháp "Do Thái" — học sâu từng câu, luyện nghe hiểu, dịch Anh–Việt, mind game điền chỗ trống và ôn tập spaced repetition (SM‑2). App **local‑first** (Hive), không cần tài khoản, chạy trên Android · iOS · Windows · Linux · macOS · **Web**.

![Flutter](https://img.shields.io/badge/Flutter-stable-02569B) ![Dart](https://img.shields.io/badge/Dart-%E2%89%A5%203.10-29B6F6) ![Version](https://img.shields.io/badge/version-1.1.0%2B2-blue) ![Release](https://img.shields.io/badge/release-v1.1.0-brightgreen) ![Tests](https://img.shields.io/badge/tests-90%20case%20%2F%209%20file-yellowgreen) ![Platforms](https://img.shields.io/badge/platforms-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-lightgrey) ![License](https://img.shields.io/badge/license-private-red)

---

## 📌 Hiện trạng (khảo sát 09/11/2026)

Bảng này là **kết quả rà soát codebase + GitHub Actions + Releases tại thời điểm ghi**, không phải mục tiêu.

| Hạng mục | Hiện trạng |
|---|---|
| Phiên bản trong code | `1.1.0+2` (`pubspec.yaml`) — ⚠️ `AppConstants.appVersion` vẫn là `1.0.0` nên màn *Cài đặt → Về ứng dụng* hiển thị sai số phiên bản |
| Release mới nhất | **v1.1.0** (27/09/2026): `VipLang-Android-ARM64-v1.1.0.apk` + `.aab` |
| Release trước | v1.0 (29/05/2026): APK ARM64, IPA (sideload), Windows `.zip`, Linux `.zip` |
| Build đa nền tảng (lần chạy `full_build` gần nhất trên `master`, 24/10/2026) | ✅ Android · ✅ Linux · ❌ Windows (hỏng ở step *Build Windows*) · ❌ iOS (hỏng ở step *Install Pods*) → job *Create Release* bị skip |
| Bản Web | ✅ `flutter build web` thành công trên CI · ❌ **chưa deploy được** vì GitHub Pages chưa bật nguồn *GitHub Actions* (`has_pages = false`) → `https://pabhassaracitto.github.io/viplang/` chưa sống |
| CI trên Pull Request | ✅ `CI` (flutter analyze) + `PR guard` + `Web build` xanh lần cuối ở PR #5 (20/10/2026) |
| `flutter test` trong CI | ❌ **chưa chạy** — `ci.yml` hiện chỉ có step *analyze*; `ci.yml` cũng **chỉ trigger trên Pull Request**, không chạy khi push thẳng `master` (khác với mô tả trong `docs/TESTING.md` & `docs/PR_GUIDE.md`) |
| Test có trong repo | **90 test case / 22 group / 9 file** (chạy tay: `flutter test`) |
| Nguồn audio | Supabase Storage (nguồn chính) + GitHub Releases `audio-v1` (mirror dự phòng) — ⚠️ release **`audio-v1` chưa tồn tại**, tức mirror dự phòng đang rỗng; cần chạy `tools/upload_audio.sh` |
| Ký release Android | Cấu hình Gradle đã sẵn (`key.properties` → fallback debug key). Nếu 4 GitHub Secrets chưa được khai thì APK trên CI vẫn ký bằng **debug key** — xem [`docs/KEYSTORE.md`](docs/KEYSTORE.md) |
| Nội dung | 13 chủ đề × 2 ngày = **26 buổi học** · **154 phase** · **556 từ vựng** · **117 câu quiz** · **52 track audio** |
| Quy mô code | ~**36.900** dòng Dart trong `lib/` (riêng `lib/data/content/` ~**18.400** dòng) · 16 file màn hình · 6 widget · 4 bloc · 10 service |
| App ID | `com.viplang.app` (Android `namespace` + `applicationId`, iOS/macOS bundle id, Linux app id) |
| Tài khoản / sync cloud | ❌ chưa có — 100% Hive cục bộ, không Firebase, không backend riêng |
| Ngôn ngữ UI | Tiếng Việt hardcode (chưa i18n) |

---

## ✨ Tính năng chính

| Tính năng | Mô tả |
|---|---|
| 📖 **13 chủ đề × 2 ngày** | Offices → Kiến thức Y tế & Kỹ thuật; 26 buổi học, 556 từ vựng, 117 câu quiz |
| 🎧 **5 loại phase** | Đọc–nghe · Dịch · Mind game · Từ vựng · Quiz nghe (Ngày 1: 4 phase; Ngày 2: 6–9 phase) |
| 🔁 **Ôn tập SRS (SM‑2)** | EF khởi tạo 2.5, sàn 1.3, interval 1 → 6 ngày; flashcard đến hạn + TTS đọc từ; badge số từ đến hạn trên tab *Ôn tập* |
| 📊 **Tiến độ & gamification** | Streak, XP theo ngày (`dailyXP`), 6 badge, % từng chủ đề, unlock tuần tự, **13 "bí mật" học tập** |
| ❄️ **Streak freeze** | 1 lượt/tuần cứu chuỗi khi bỏ lỡ 1 ngày (`StreakService` — hàm thuần, có test) |
| 🎯 **Mục tiêu & Onboarding** | 3 màn: chào → đặt mục tiêu TOEIC (điểm / phút mỗi ngày / ngày thi) → hướng dẫn 5 phase; sửa lại được từ Cài đặt & Tiến độ |
| 📈 **Biểu đồ** | Heatmap 7 ngày + line chart XP (`fl_chart`) + thanh % từng chủ đề |
| 🎵 **Audio offline** | Tải 52 track: mirror ưu tiên Supabase → **tự chuyển GitHub Releases khi lỗi**, retry 3 lần/file, timeout 30 s, 4 luồng song song; phân loại lỗi (`DownloadErrorKind`) để báo đúng nguyên nhân |
| 📥 **Nhập MP3 có sẵn** | Cài đặt → *Dữ liệu âm thanh* → chọn file hoặc cả thư mục MP3; app tự đổi tên về chuẩn `themeNN_trackMM.mp3` (track 3–54) |
| 🔊 **TTS dự phòng + karaoke** | Chưa có MP3 thì đọc cả bài bằng giọng máy, chữ được tô sáng theo từ (`KaraokeTextWidget`) — buổi học không bị tắc |
| 🎧 **Playlist nghe thụ động** | Màn *List audio thông minh* (`/audio`): nghe theo chủ đề, chọn số lần lặp (1/2/3/5/10), hẹn giờ tắt (15/30/60 phút) |
| 🔔 **Nhắc học hằng ngày** | Local notification (`zonedSchedule` inexact — không cần quyền exact alarm), chọn giờ trong Cài đặt; hỗ trợ Android / iOS / macOS; có boot receiver giữ lịch sau khi khởi động lại máy |
| 🌗 **Sáng / Tối / Theo hệ thống** | `AppColors` + `AppTextStyles` theo `Brightness`, `MaterialApp.router` với `darkTheme`; đổi giao diện remount cây widget nên không mất vị trí màn hình |
| 🧭 **Điều hướng & deep link** | `go_router` làm router gốc; `viplang://theme/05/day/2` mở thẳng bài học (Android intent‑filter + iOS `CFBundleURLTypes`) |
| ⚙️ **Cài đặt** | Giao diện · mở khóa chủ đề tự do · dữ liệu audio (dung lượng đã tải, tải lại file thiếu / toàn bộ, nhập MP3) · TTS bật/tắt · tốc độ phát mặc định 0.75×–1.5× · mục tiêu · nhắc học · xóa tiến độ · About |
| 🌐 **Chạy trên trình duyệt** | Flutter Web; audio **stream trực tiếp** từ mirror; tiến độ lưu trong IndexedDB; phần file/notification tách bằng conditional import |

---

## 🌐 Nền tảng & khác biệt

| Tính năng | Android / iOS / Desktop | Web |
|---|---|---|
| Học, bài tập, quiz, mind game | ✅ | ✅ |
| Tiến độ, streak, XP, mục tiêu | ✅ (Hive) | ✅ (Hive → IndexedDB) |
| Nghe audio bài học | MP3 đã tải / đã nhập, hoặc tải khi cần | Phát trực tiếp từ máy chủ (Supabase → GitHub Releases) |
| Tải toàn bộ audio · xóa audio · nhập MP3 | ✅ | ❌ (ẩn trong Cài đặt, thay bằng ghi chú) |
| Nhắc học bằng thông báo | ✅ Android / iOS / macOS | ❌ (công tắc bị vô hiệu) |
| TTS đọc từ / đọc bài | ✅ | ✅ (Web Speech API) |
| Dùng offline | ✅ (sau khi tải audio) | ❌ cần mạng để nghe audio |

Chi tiết: [`docs/WEB.md`](docs/WEB.md).

---

## 🖼️ Màn hình & luồng học

**Bottom nav 4 tab:** Trang chủ · Học tập · Ôn tập · Tiến độ.

```
Splash (kiểm tra & tải audio lần đầu — có nút bỏ qua)
  └─ Onboarding (chỉ lần đầu: chào → mục tiêu → cách học)
      └─ Home ─┬─ ThemeList (13 chủ đề, khóa/mở theo tiến độ)
               │    └─ LessonSelector (Ngày 1 / Ngày 2)
               │         └─ LessonDay ── 5 loại phase ── LessonComplete (XP, streak, badge, unlock chủ đề kế)
               ├─ SrsReview (flashcard đến hạn + TTS)
               ├─ Progress (mục tiêu, heatmap, line chart XP, 13 bí mật, huy hiệu)
               ├─ AudioPlaylist (nghe thụ động, lặp, hẹn giờ tắt)
               └─ Settings (avatar 👤 góc phải trên)
```

**Route (`go_router`):** `/` · `/onboarding` · `/home` · `/themes` · `/srs` · `/progress` · `/settings` · `/audio` · `/theme/:themeNumber/day/:dayNumber`

Deep link sai → màn hình lỗi có nút *Về trang chủ*.

---

## 📚 Nội dung 13 chủ đề

| # | Chủ đề (EN) | Tên tiếng Việt | Icon | Từ vựng | Phase |
|---|---|---|---|---|---|
| 1 | Offices | "Trong" Văn Phòng | 🏢 | 41 | 13 |
| 2 | General Business | Các Vấn Đề Thương Mại Tổng Quát | 💼 | 40 | 10 |
| 3 | Technical Areas | Các Vấn Đề Kỹ Thuật | 💻 | 44 | 13 |
| 4 | Travel | Đi Lại và Công Tác | ✈️ | 37 | 13 |
| 5 | Entertainment | Giải Trí | 🎭 | 55 | 13 |
| 6 | Purchasing | Mua Sắm Trong Doanh Nghiệp | 🧾 | 48 | 13 |
| 7 | Dining Out | Đi Ăn Nhà Hàng | 🍽️ | 36 | 13 |
| 8 | Personnel | Nhân Sự | 👥 | 43 | 13 |
| 9 | Finance and Budgeting | Tài Chính và Dự Thảo Ngân Sách | 💰 | 48 | 13 |
| 10 | Corporate Development | Phát Triển Sản Phẩm Trong Doanh Nghiệp | 📈 | 38 | 10 |
| 11 | Manufacturing | Sản Xuất | 🏭 | 29 | 10 |
| 12 | Housing & Corporate Property | Nhà Đất & Tài Sản Doanh Nghiệp | 🏠 | 45 | 10 |
| 13 | Technical & Medical Knowledge, Fitness, and Nutrition | Kiến thức Y tế & Kỹ thuật, Thể hình và Dinh dưỡng | 🏥 | 52 | 10 |
| | | | **Tổng** | **556** | **154** |

Mỗi từ vựng có: phát âm, loại từ, ví dụ EN/VI và các trường SRS (`repetitionCount`, `easeFactor`, `intervalDays`, `nextReview`).

Nội dung đang **hardcode trong Dart** (`lib/data/content/themeNN_content.dart`) — sửa nội dung là phải release app. `ContentValidator` chạy ở chế độ DEBUG (assert trong `AllThemesRegistry`) và trong `test/data/content/content_validator_test.dart` để bắt lỗi cấu trúc phase, lệch `mixedSegments` ↔ `fabAnswers`, quiz sai index.

---

## 🛠️ Phát triển

### Yêu cầu

- Flutter **stable** với Dart SDK `>=3.10.0 <4.0.0` (theo `environment.sdk` trong `pubspec.yaml`)
- Android Studio / Xcode nếu build native; JDK 17 cho Gradle
- `gh` (GitHub CLI) nếu dùng `tools/upload_audio.sh`

### Chạy local

```bash
# 3 thư mục asset này KHÔNG có trong repo (assets/audio/ bị .gitignore) — phải tạo trước,
# nếu không flutter build/run sẽ fail vì thiếu asset khai báo trong pubspec.yaml
mkdir -p assets/animations assets/audio assets/data

flutter pub get
flutter run
```

Sinh lại code Hive (chỉ khi đổi model có `@HiveType`):

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Chạy trên web

```bash
flutter run -d chrome                                   # dev, đường dẫn gốc
flutter build web --release --base-href "/viplang/"      # giống CI / GitHub Pages
cd build/web && python3 -m http.server 8080              # xem thử bản đã build
```

### Analyze & test

```bash
flutter analyze --no-fatal-infos
flutter test
flutter test test/core/utils/srs_algorithm_test.dart     # 1 file
flutter test --coverage                                  # + coverage/lcov.info
```

### Kiểm thử thủ công

Dark mode, thông báo nhắc học, deep link, audio trên máy thật — **CI không kiểm được**. Checklist từng bước: [`docs/TESTING.md`](docs/TESTING.md).

```bash
adb shell am start -a android.intent.action.VIEW -d "viplang://theme/05/day/2"   # deep link
adb shell dumpsys notification --noredact | grep -i viplang                      # lịch thông báo
```

---

## 🧪 Test trong repo

90 test case / 22 group, chia 9 file (số liệu đếm trực tiếp từ `test/`):

| File | Case | Nội dung |
|---|---|---|
| `test/core/utils/srs_algorithm_test.dart` | 12 | SM‑2: wrong/good/easy, sàn EF 1.3, interval, retention |
| `test/core/services/streak_service_test.dart` | 14 | Streak + đóng băng (1 lượt/tuần, reset theo tuần), `StudyLog` XP theo ngày |
| `test/core/services/app_settings_test.dart` | 14 | `AppThemeMode.fromKey`/nhãn/`ThemeMode`, `resolveBrightness`, `formatTime`, `NotificationService.nextOccurrence`, `AppColors` sáng/tối |
| `test/core/services/audio_import_service_test.dart` | 15 | Đoán track 3–54 từ tên file MP3 (tên chuẩn / tên kiểu đĩa CD / số đầu‑cuối), đúng 52 file, bỏ qua track giới thiệu |
| `test/core/services/audio_path_resolver_test.dart` | 8 | 52 file audio, công thức tên file, lỗi tham số |
| `test/core/services/download_service_test.dart` | 8 | Tự chuyển mirror khi 5xx, không retry với 404, phân loại lỗi `network`/`notFound`, `remoteUrlsFor` (stream cho Web), gộp lỗi nhiều mirror |
| `test/core/services/tts_service_test.dart` | 7 | Cắt văn bản dài thành đoạn cho TTS: không mất chữ, cắt cuối câu, gộp câu ngắn, coi xuống dòng là ranh giới |
| `test/data/content/content_validator_test.dart` | 8 | 13 theme × 2 ngày: đủ theme/day, ≥4 phase mỗi ngày, `ContentValidator.validateAllLessonDays` không lỗi, quiz `correctIndex` trong bounds, nội dung song ngữ EN ↔ VI khớp từng đoạn |
| `test/widget_test.dart` | 4 | `ThemeListScreen`: tiêu đề, nút thoát khi push / không thoát khi là tab; palette + text styles khởi tạo ổn định |

> ⚠️ Các test này **chưa được chạy tự động trong CI** (xem mục dưới). Trước khi mở PR hãy chạy `flutter test` tại máy — đó là checklist trong `.github/PULL_REQUEST_TEMPLATE.md`.

---

## ⚙️ CI/CD

4 workflow đang có trong `.github/workflows/`:

| Workflow | Trigger | Làm gì | Trạng thái |
|---|---|---|---|
| `ci.yml` — **CI** | Pull Request → `master`/`main` | `dart format` (chỉ cảnh báo) + `flutter analyze --no-fatal-infos`, phát GitHub annotation từng lỗi, upload `analyze-report` | ✅ xanh (PR #5) · ⚠️ **không có step `flutter test`**, không chạy khi push |
| `pr_guard.yml` — **PR guard** | Pull Request + `workflow_dispatch` | `tools/pr_guard.sh`: Conventional Commits, dấu xung đột merge, file cấm commit (keystore/APK/AAB), cảnh báo nhánh lệch sau base | ✅ xanh |
| `web_pages.yml` — **Web — build & GitHub Pages** | push `master`, PR `master`, `workflow_dispatch` | `flutter build web --base-href /viplang/`, tạo `404.html` (SPA routing) + `.nojekyll`, upload artifact; **deploy chỉ khi push `master`** | ✅ build · ❌ deploy (Pages chưa bật) |
| `full_build.yml` — **Flutter Full Build** | tag `v*` / `[0-9]+.[0-9]+*` + `workflow_dispatch` (chọn nền tảng, tag, có tạo Release) | Android APK (ARM64) + AAB · iOS IPA (no‑codesign) · Windows `.zip` · Linux `.zip` → *Create Release* đính kèm | ✅ Android, Linux · ❌ Windows, iOS (run 24/10/2026) |

**Bật GitHub Pages (làm một lần):** Settings → Pages → *Build and deployment* → Source = **GitHub Actions**
(hoặc `gh api -X POST repos/<owner>/<repo>/pages -f build_type=workflow`). Sau đó push `master` → trang lên tại `https://pabhassaracitto.github.io/viplang/`.

> 📝 `docs/TESTING.md` và `docs/PR_GUIDE.md` còn nhắc tới workflow `android_check.yml` (*Android build check*) — file này **đã bị gỡ khỏi repo**, hai tài liệu đó cần cập nhật lại.

---

## 🏗️ Kiến trúc

```
lib/
├── core/
│   ├── constants/     # AppColors (getter theo Brightness), AppTextStyles, AppConstants
│   ├── router/        # app_router.dart — go_router, deep link viplang://, màn lỗi deep link
│   ├── services/
│   │   ├── hive_service.dart            # mở 4 box: themes / vocab / progress / settings
│   │   ├── app_settings.dart            # themeMode, reminderEnabled/Hour/Minute (ChangeNotifier)
│   │   ├── download_service.dart        # mirror Supabase → GitHub Releases, retry, timeout, 4 luồng
│   │   ├── audio_path_resolver.dart     # whitelist 52 file, công thức themeNN_trackMM.mp3
│   │   ├── audio_import_service.dart    # nhập MP3 từ máy → đổi tên chuẩn
│   │   ├── local_file_store.dart        # (+ _io / _stub / _types) — tách native vs web
│   │   ├── notification_service.dart    # (+ _io / _stub) — nhắc học hằng ngày
│   │   ├── safe_audio_service.dart      # local → asset → stream (web) → báo lỗi có nút tải
│   │   ├── streak_service.dart          # streak + freeze + StudyLog XP theo ngày (hàm thuần)
│   │   └── tts_service.dart             # flutter_tts: speak / speakLongText, cắt đoạn ≤280 ký tự, tốc độ đọc
│   └── utils/         # srs_algorithm.dart — SM-2 (dart:math exp, guard interval ≤ 0)
├── data/
│   ├── content/       # theme1..13_content.dart + ContentValidator + AllThemesRegistry
│   └── models/        # ThemeModel, VocabModel, LessonDay/LessonPhase, UserProgressModel,
│                      # MixedSegmentModel (+ *.g.dart — Hive TypeAdapter)
└── presentation/
    ├── blocs/         # ThemeBloc, LessonBloc, MindGameBloc, ProgressBloc (event/state)
    ├── screens/       # 11 màn hình + 5 phase screen (16 file)
    └── widgets/       # audio_player, karaoke_text, mixed_text, activity_charts,
                       # vocab_of_the_day, vocabulary_speaker_button
```

**Nguyên tắc:**

- **Local‑first** — tiến độ lưu Hive, không bắt buộc tài khoản, không gọi backend riêng.
- **Một nguồn sự thật cho nội dung** — `AllThemesRegistry` (metadata theme, lesson, vocab). `ThemeBloc` seed và sinh thứ tự unlock từ Registry (không còn hardcode lần 2 → 13/13 chủ đề đều unlock được).
- **Audio path tập trung** — `AudioPathResolver` giữ whitelist 52 file; không hardcode path trong màn hình.
- **Web‑safe** — không file nào ngoài `*_io.dart` được `import 'dart:io'`; phần nền tảng đi qua conditional import (`local_file_store`, `notification_service`).
- **Validate nội dung** — `ContentValidator` chạy khi DEBUG và trong test (26 `LessonDay`).

**Dependency chính:** `flutter_bloc` · `equatable` · `hive` + `hive_flutter` · `just_audio` · `flutter_tts` · `flutter_local_notifications` + `timezone` + `flutter_timezone` · `go_router` · `fl_chart` · `flutter_animate` · `path_provider` · `file_picker`.
Dev: `flutter_lints` · `build_runner` + `hive_generator` · `flutter_launcher_icons` · `flutter_native_splash`.

---

## 🔊 Audio: nguồn & mirror

| Thứ tự | Nguồn | Cấu hình (`--dart-define`) |
|---|---|---|
| 1 | Supabase Storage | `AUDIO_PRIMARY_BASE_URL` (mặc định: `https://nlorlkoeygtllnotzrwz.supabase.co/storage/v1/object/public/viplang`) |
| 2 | GitHub Releases của repo | `AUDIO_FALLBACK_BASE_URL` (mặc định: `…/releases/download/audio-v1`) |

```bash
# Upload 52 MP3 lên mirror dự phòng (tự tạo release audio-v1 nếu chưa có)
tools/upload_audio.sh /đường/dẫn/tới/thư_mục_mp3

# Trỏ app sang host khác lúc build, không cần sửa code
flutter build apk --dart-define=AUDIO_PRIMARY_BASE_URL=https://… \
                  --dart-define=AUDIO_FALLBACK_BASE_URL=https://…
```

> ⚠️ **Hiện tại release `audio-v1` chưa tồn tại trên repo** → mirror dự phòng đang rỗng, app chỉ còn nguồn Supabase (free tier có thể bị pause). Nên chạy `tools/upload_audio.sh` để có dự phòng thật sự.

Chi tiết phân loại lỗi hiển thị trên UI: [`docs/AUDIO_HOSTING.md`](docs/AUDIO_HOSTING.md).

---

## 📦 Phát hành

```bash
# 1. Đổi version
#    pubspec.yaml → version: 1.2.0+3   (đồng bộ luôn AppConstants.appVersion)

# 2. Tag & push — full_build.yml tự chạy
git tag v1.2.0 && git push origin v1.2.0

# Hoặc chạy tay, chọn nền tảng + có tạo Release hay không:
# GitHub → Actions → "Flutter Full Build" → Run workflow
```

**Ký release Android** — tạo `android/key.properties` (đã gitignore, **không commit**):

```properties
storePassword=<mật khẩu keystore>
keyPassword=<mật khẩu key>
keyAlias=viplang
storeFile=<đường dẫn .jks>
```

CI đọc 4 GitHub Secrets: `KEYSTORE_BASE64`, `KEYSTORE_PASSWORD`, `KEY_ALIAS`, `KEY_PASSWORD`.
Không có `KEYSTORE_BASE64` → workflow **fallback ký debug** (app cài được nhưng không đưa lên Play Store). Hướng dẫn tạo keystore + base64 + khai secrets: [`docs/KEYSTORE.md`](docs/KEYSTORE.md).

**Lịch sử release:**

| Tag | Ngày | Artifact |
|---|---|---|
| `v1.1.0` | 27/09/2026 | `VipLang-Android-ARM64-v1.1.0.apk`, `VipLang-Android-v1.1.0.aab` |
| `v1.0` | 29/05/2026 | APK ARM64, IPA (sideload), Windows `.zip`, Linux `.zip` |

---

## 🚧 Việc còn tồn (từ đợt khảo sát này)

**Chặn phát hành / dễ gây hiểu lầm**

1. `ci.yml` **không chạy `flutter test`** và không trigger khi push `master` → 90 test trong repo chỉ có giá trị khi dev tự chạy tay (docs đang mô tả ngược lại). Repo đã có sẵn `test_report.py` (biến log test thành GitHub annotation) — chỉ cần thêm step `flutter test` vào `ci.yml` và mở trigger `push: branches: [master]`.
2. `docs/TESTING.md` + `docs/PR_GUIDE.md` tham chiếu `android_check.yml` — workflow **không còn** trong repo.
3. GitHub Pages chưa bật → workflow `web_pages` đỏ ở job *Deploy* mỗi lần push `master`, bản web chưa có URL công khai.
4. Mirror audio `audio-v1` chưa upload → không có dự phòng khi Supabase pause.
5. Job **Windows** và **iOS** trong `full_build.yml` đang đỏ (step *Build Windows* / *Install Pods*) → tag mới sẽ không có artifact 2 nền tảng này và *Create Release* bị skip.
6. Keystore: cần chủ app tạo `.jks` + khai 4 secrets, nếu không APK release vẫn ký debug.

**Lệch số liệu / dọn dẹp**

7. `AppConstants.appVersion = '1.0.0'` vs `pubspec.yaml = 1.1.0+2` → Settings hiện sai phiên bản.
8. `AppConstants.reviewQueueBox` và `AppConstants.userBox` được khai báo nhưng không dùng (Hive chỉ mở 4 box) — hằng số chết.
9. `docs/TESTING.md` ghi "55 test" (thực tế 90) và thiếu 3 file test mới (`audio_import_service`, `download_service`, `tts_service`).
10. `PLAN.md` còn số liệu cũ (~32.200 dòng Dart, "Trạng thái: Release v1.0", "Cập nhật 23/09/2026").
11. `.gitignore` đang ignore `linux/`, `windows/`, `macos/`, `/assets/audio/` và chính `.gitignore` — các thư mục desktop vẫn được track vì đã commit trước khi bị ignore; dễ gây nhầm cho người mới.
12. Chưa có `CHANGELOG.md` / `CONTRIBUTING.md`.

**Sản phẩm (theo PLAN.md Giai đoạn 4–5)**

13. Nội dung hardcode Dart → chưa tách JSON/remote content bundle; chưa có chủ đề 14+.
14. Chưa có tài khoản / sync đa thiết bị / backup‑restore tiến độ.
15. Chưa i18n (UI tiếng Việt hardcode).
16. Chưa có listing store, privacy policy, analytics.

---

## 🤝 Đóng góp

1. Nhánh mới từ `master` → commit theo **Conventional Commits** `type(scope): mô tả` (`scope` không dấu: `feat(v1.2)`, `fix(content)`, `ci(android)`).
2. Mỗi commit = một chức năng. Tự kiểm tra trước khi mở PR:

   ```bash
   git log --oneline origin/master..HEAD
   tools/pr_guard.sh origin/master HEAD
   flutter analyze --no-fatal-infos && flutter test
   ```

3. Mở PR — điền `.github/PULL_REQUEST_TEMPLATE.md` (bảng commit ↔ chức năng, mục *Đã kiểm thử*, rủi ro Hive/quyền/dependency). `PR guard` + `CI` + `Web build` sẽ chạy tự động.

Quy ước chi tiết & cách bật branch protection: [`docs/PR_GUIDE.md`](docs/PR_GUIDE.md).

**Tài liệu:** [WEB](docs/WEB.md) · [TESTING](docs/TESTING.md) · [AUDIO_HOSTING](docs/AUDIO_HOSTING.md) · [KEYSTORE](docs/KEYSTORE.md) · [PR_GUIDE](docs/PR_GUIDE.md) · [PLAN](PLAN.md)

---

## 📋 Lộ trình

Xem [`PLAN.md`](PLAN.md) — Giai đoạn 1 (MVP) ✅, Giai đoạn 2 (v1.1) ✅, Giai đoạn 3 (trải nghiệm & giữ chân) ✅ code, Giai đoạn 4 (cloud / mở rộng nội dung) và Giai đoạn 5 (phát hành & tăng trưởng) chưa làm, kèm rủi ro kỹ thuật và các câu hỏi cần quyết.

## 📄 License

Dự án riêng — **chưa cấp phép mở** (repo không có file `LICENSE`). Repo để chế độ *public* trên GitHub nhằm chạy GitHub Actions + GitHub Pages, nhưng mã nguồn không nhằm mục đích cho sử dụng / phân phối lại.
