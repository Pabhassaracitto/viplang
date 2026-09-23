# VIPLANG — Kế hoạch dự án & Lộ trình phát triển

> **App:** VipLang — Học tiếng Anh theo phương pháp Do Thái (nội dung 13 chủ đề TOEIC)
> **Stack:** Flutter (Dart ≥3.10), Bloc/Cubit, Hive local-first, audio từ Supabase Storage
> **Trạng thái:** Release **v1.0** (29/05/2026) — APK Android, IPA iOS sideload, Windows, Linux
> **Cập nhật:** 23/09/2026 — dựa trên rà soát toàn bộ codebase, CI và GitHub

---

## 1. Tổng quan hiện trạng

### 1.1. Quy mô codebase

| Hạng mục | Số lượng |
|---|---|
| Code Dart (`lib/`) | ~32.200 dòng |
| Nội dung 13 chủ đề (`data/content/`) | ~18.300 dòng |
| Chủ đề (theme) | 13 theme × 2 ngày = **26 bài học** |
| Từ vựng | **556 từ** (có phát âm, loại từ, ví dụ EN/VI, trường SRS) |
| Quiz hỏi | 117 câu (9/theme) |
| File audio server (Supabase) | **52 tracks** (theme01_track03 → theme13_track54) |
| Màn hình (screens) | 16 màn hình + 5 phase học + widgets |
| Bloc | Theme, Lesson, MindGame, Progress, Audio (chưa dùng), SRS inline |
| CI/CD | GitHub Actions build 4 nền tảng + GitHub Release |

### 1.2. Kiến trúc hiện tại

```
lib/
├── core/            # constants, services (Hive, Download, TTS, SafeAudio, AudioPathResolver), utils (SRS/SM-2)
├── data/
│   ├── content/     # 13 file nội dung hardcode + ContentValidator + Registry
│   └── models/      # Theme, Vocab, UserProgress, Lesson (Hive TypeAdapter)
└── presentation/
    ├── blocs/       # ThemeBloc, LessonBloc, MindGameBloc, ProgressBloc
    ├── screens/     # splash, home, themes, lesson (+5 phases), progress, vocab(SRS)
    └── widgets/     # audio player, mixed text, vocab of the day, speaker
```

**Flow học tập đã chạy được:**
Splash → (tải audio lần đầu) → Home (4 tab: Home / 13 Chủ đề / Ôn tập SRS / Tiến độ)
→ ThemeList → LessonSelector (Day 1/2) → LessonDay → 5 phase:
`read_listen → vocabulary → translate → mind_game → listening_quiz`
→ LessonComplete (XP, streak, badge, unlock theme kế) → SRS review lặp lại.

### 1.3. Tiến độ theo lĩnh vực

| # | Lĩnh trạng | Tiến độ | Ghi chú |
|---|---|---|---|
| 1 | **Nội dung 13 chủ đề** | 🟢 **~95%** | Đủ 13 theme × 2 day, 556 từ; validate DEBUG qua `ContentValidator` |
| 2 | **Luồng học 5 phase** | 🟢 **~90%** | Đầy đủ UI 5 phase, review mode, resume theo phase |
| 3 | **Audio pipeline** | 🟢 **~85%** | Path resolver tập trung, download on‑demand + bulk khi splash, fallback asset, chặn HTML lỗi |
| 4 | **SRS (SM‑2)** | 🟢 **~80%** | Algorithm + màn ôn tập + vocab library; chưa có lịch nhắc thông báo |
| 5 | **Gamification** | 🟡 **~60%** | XP, streak, 3 badge; **thiếu** streak freeze UI, Goal (UserGoal chưa đặt được), charts (fl_chart chưa dùng) |
| 6 | **Tiến độ & thống kê** | 🟡 **~65%** | Progress screen có badge/stats; chưa có biểu đồ xu hướng theo ngày/tuần |
| 7 | **Trạng thái / tài khoản** | 🔴 **~5%** | Firebase *không* init, không màn login, không sync cloud — chỉ Hive local |
| 8 | **Kiểm thử** | 🔴 **~5%** | Chỉ `widget_test` mẫu (chưa chắc pass); chưa test SRS/content/bloc |
| 9 | **CI/CD & Release** | 🟢 **~80%** | Build 4 nền tảng OK, Release v1.0 có artifact; **thiếu job `analyze`/`test`** |
| 10 | **Phát hành store** | 🟡 **~40%** | `applicationId = com.example.viplang`, release **sign bằng debug key**, chưa có keystore/App Bundle signing, chưa Play/App Store listing |
| 11 | **UX tinh chỉnh** | 🟡 **~55%** | Chưa có Settings, Onboarding, dark mode toggle, i18n (đang hardcode tiếng Việt) |

**Tổng tiến độ ước tính (weighted): ~70%** — sản phẩm đã *học được end‑to‑end*, phần còn lại chủ yếu là **chất lượng, kiểm thử, monetization/nội dung mở rộng và phát hành store**.

---

## 2. Những gì đã hoàn thành (Giai đoạn 1 — MVP ✅)

1. **Core app shell:** Splash (kiểm tra + tải audio lần đầu, cho phép skip), Home 4 tab, theme Material 3, font Poppins/Inter, splash/icon riêng.
2. **Toàn bộ nội dung học:** 13 chủ đề (Offices → Health), mỗi chủ đề 2 ngày với 5 loại phase; 556 từ vựng trường đầy đủ cho SRS.
3. **5 phase học hoàn chỉnh:** đọc–nghe, từ vựng (TTS), dịch Anh–Việt, mind game điền chỗ trống (mixed text), quiz nghe hiểu.
4. **Hệ thống audio:** `AudioPathResolver` (52 file server, naming chuẩn), `DownloadService` (Supabase public URL), `SafeAudioService` (local → asset → báo lỗi UI có nút tải), `AudioPlayerWidget` (tải on‑demand, tốc độ phát 0.75x/1x).
5. **SRS SM‑2:** thuật toán chuẩn (EF ≥ 1.3), màn ôn tập flashcard + TTS, tủ từ có search/filter.
6. **Tiến độ cục bộ:** streak hiện tại/cao nhất, XP, badge, % mỗi theme, unlock tuần tự theme kế, seeding Hive khi lần đầu chạy.
7. **CI/CD:** workflow manual build Android/iOS/Windows/Linux; đã chạy thành công, **Release v1.0** đính kèm APK/IPA/2 zip.

---

## 3. Rủi ro & nợ kỹ thuật cần xử lý

| # | Mức độ | Vấn đề | Vị trí |
|---|---|---|---|
| R1 | 🔴 Cao | **`themeOrder` chỉ có 11/13 theme** → hoàn thành theme 11 sẽ **không unlock theme 12 & 13** | `theme_bloc.dart:40` |
| R2 | 🔴 Cao | Release Android **sign bằng debug key** + `applicationId` vẫn `com.example.viplang` → không thể up Play, đổi ID = mất user data | `android/app/build.gradle.kts` |
| R3 | 🔴 Cao | **Không có test thực sự**; CI không chạy `flutter analyze`/`flutter test` → regression dễ lọt | `test/`, workflow |
| R4 | 🟡 Trung | Dual source of truth: metadata theme bị **hardcode lần 2** trong `ThemeBloc._getAllThemes()` thay vì dùng `AllThemesRegistry` → dễ lệch nội dung | `theme_bloc.dart:126` |
| R5 | 🟡 Trung | Firebase packages khai báo nhưng **không dùng** (không init, không google-services.json) → tăng dung lượng, gây nhầm lẫn; `AudioBloc` viết nhưng không gắn vào app | `pubspec.yaml`, `audio_bloc.dart` |
| R6 | 🟡 Trung | `go_router` khai báo nhưng điều hướng vẫn `Navigator.push` thủ công 34 chỗ → chưa có deep link / URL scheme | toàn app |
| R7 | 🟡 Trung | `downloadMultiple` tải tuần tự từng file, **không retry/timeout/pause/resume**; 52 file ≥ nhiều MB → lần đầu offline/3G dễ fail giữa chừng (flag `full_audio_downloaded` vẫn set true nếu loop chạy hết nhưng fail một phần — cần kiểm lại cờ) | `download_service.dart` |
| R8 | 🟡 Trung | Dependency chết: `fl_chart`, `google_fonts`, `lottie`, `shimmer`, `flutter_svg`, `cached_network_image`, `audioplayers`, `audio_session`, `connectivity_plus`, `shared_preferences`, `permission_handler`, `firebase_*` — **0 import trong `lib/`** | `pubspec.yaml` |
| R9 | 🟢 Thấp | README vẫn là template Flutter; không có CONTRIBUTING/CHANGELOG; `assets/audio|data|animations` trống (CI phải `mkdir`) | root |
| R10 | 🟢 Thấp | Streak freeze có hằng số `streakFreezeMaxPerWeek` nhưng **chưa có logic/UI**; `UserGoal` model + adapter có sẵn nhưng chưa màn hình đặt mục tiêu | `app_constants`, models |
| R11 | 🟢 Thấp | `_exp` trong `SrsAlgorithm.calculateRetention` là xấp xỉ sai với `x>0` (`1/(1-x)` blow-up) — nên dùng `math.exp` | `srs_algorithm.dart` |

---

## 4. Lộ trình các giai đoạn tiếp theo

### 🏁 Giai đoạn 2 — “Vững chắc v1.1” (Ước tính 2–3 tuần) — *ĐANG LÀM*

**Mục tiêu:** khoá regression, sửa bug chặn release, chuẩn bị lên store.

- [x] **R1 — Fix unlock 12/13:** `themeOrder` sinh từ `AllThemesRegistry` (đủ 13/13); **xóa `_getAllThemes()` hardcode** trong ThemeBloc, seed từ Registry (gộp R4).
- [x] **R3 — Chất lượng CI:** workflow `.github/workflows/ci.yml` — `flutter analyze` + `flutter test` trên mọi push/PR.
- [x] **R3 — Test nền tảng:**
  - Unit test `SrsAlgorithm` (wrong/good/easy, EF floor, interval, retention).
  - Test `ContentValidator` quét **CI mode** 26 LessonDay + 13 theme unlock state + quiz bounds.
  - Test `AudioPathResolver.getFileName` (52 file khớp whitelist, formula, error cases).
  - Widget test `ThemeListScreen` (thay widget_test mẫu đang fail).
- [ ] **R2 — Chuẩn bị Play Store:** ~~ký release qua `key.properties`~~ ✅ cấu hình sẵn (`signingConfigs.release` nếu có file, fallback debug); **còn chờ:** quyết định `applicationId` thật + tạo keystore + GitHub Secrets (`KEYSTORE_BASE64`…).
- [x] **R7 — Download chắc chắn hơn:** retry 3 lần/file + timeout 30s, tải song song 4 luồng, chỉ set `full_audio_downloaded=true` khi *tất cả* file OK; Splash hiển thị cảnh báo nếu thiếu file.
- [x] **R8 — Dọn pubspec:** gỡ Firebase (`firebase_*`), `audioplayers`, `audio_session`, `google_fonts`, `lottie`, `shimmer`, `flutter_svg`, `cached_network_image`, `connectivity_plus`, `shared_preferences`, `permission_handler`, `uuid`, `intl`; giữ `fl_chart` + `go_router` cho Giai đoạn 3; xóa `AudioBloc` chết; version → `1.1.0+2`.
- [x] **R10 một phần:** màn **Settings** (`settings_screen.dart`): dung lượng audio đã tải, tải lại file thiếu / toàn bộ, toggle TTS, tốc độ phát mặc định, xóa tiến độ,About; entry từ avatar Home.
- [x] **R11 — Fix `SrsAlgorithm._exp`:** dùng `dart:math` `exp` thật + guard `interval ≤ 0`.
- [x] **R9 — README** viết lại: mô tả app, tính năng, run/build/test, kiến trúc, release, link PLAN.

**Còn lại cho v1.1:**
- [x] **CI xanh lần đầu** — analyze + 27+ unit/widget tests pass trên GitHub Actions (run `35902346953`, 23/09/2026)
- [ ] **R2 còn lại:** quyết định `applicationId` thật + tạo keystore + khai GitHub Secrets (`KEYSTORE_BASE64`, `KEYSTORE_PASSWORD`, `KEY_ALIAS`, `KEY_PASSWORD`) → tag **v1.1** + APK signed release

**Fix nội dung phát hiện khi chạy ContentValidator CI:**
- Theme 1 dùng orientation `(EN, VI)` của `MixedSegment.vietnamese` — validator giờ khớp cả 2 chiều
- Theme 8 fabAnswers số ít/đa lệch segment → đồng bộ số nhiều
- Duplicate `fabAnswers.vi` theo ngữ cảnh (Để nghe → To hear/To listen to) → warning

---

### 🚀 Giai đoạn 3 — “Trải nghiệm & Giữ chân người dùng” (Ước 3–5 tuần)

**Mục tiêu:** biến app “học được” thành app “học đều mỗi ngày”.

1. **Onboarding 3 màn:** chào → đặt mục tiêu (**hoàn thiện `UserGoal`**: điểm TOEIC mục tiêu, phút học/ngày, ngày thi) → hướng dẫn cơ bản.
2. **Progress bằng biểu đồ (`fl_chart`):** heatmap 7/30 ngày, line chart XP/tuần, % từng theme (bar).
3. **Streak freeze:** dùng `streakFreezeMaxPerWeek`, nút “Đóng băng streak” khi mất ngày.
4. **Nhắc học (local notifications):** khung giờ người dùng đặt; **không** cần Firebase.
5. **Nâng SRS:** lịch ôn tập ngày mai trên Home (“Hôm nay bạn có 12 từ đến hạn”), badge due‑count ở tab Ôn tập, ôn tập sau mỗi phase vocabulary.
6. **Điều hướng chuẩn hoá:** migrate sang `go_router` (đã cài) → deep link `viplang://theme/05/day/2`, easier test.
7. **Dark mode** + toggle trong Settings (`AppColors` hiện light-only).
8. **Tối ưu audio UX:** phát chậm 0.75x đã có — thêm A/B “nghe cả câu sau khi chọn đáp án quiz”, transcript tự động hiện khi sai.

**Deliverable:** v1.2 — onboarding, charts, streak freeze, notifications, go_router.

---

### ☁️ Giai đoạn 4 — “Cloud & Nội dung mở rộng” (Ước 4–6 tuần) — *tùy chọn theo chiến lược*

Chỉ chọn **một trong hai hướng** sau khi có quyết định sản phẩm:

**Hướng A — Local‑first mở rộng (nhẹ, hợp với vibe hiện tại):**
- [ ] Tách nội dung 13 theme ra **JSON/remote config** (hiện hardcode Dart → mỗi lần sửa nội dung là release app); app tải content bundle từ Supabase + version check.
- [ ] Thêm **chủ đề 14+ / unit theo cấp độ** (elementary → advanced) dựa trên template phase có sẵn.
- [ ] Export/backup tiến độ ra file (Hive box → JSON) + import.
- [ ] Script validate nội dung chạy ngoài app (Dart test với ContentValidator mở rộng: kiểm tra audioTrackKey có trong whitelist, ví dụ EN/VI không rỗng, quiz đúng index…).

**Hướng B — Cloud sync & tài khoản (khi nào cần nhiều thiết bị / cộng đồng):**
- [ ] **Firebase Auth** (Google/Apple/Email) — hiện deps đã có nhưng phải cấu hình `google-services.json` / `GoogleService-Info.plist`.
- [ ] Sync `UserProgressModel` + SRS state lên **Cloud Firestore** (offline‑first đã là Hive → sync layer ở repository).
- [ ] Leaderboard bạn bè, nhiệm vụ tuần.
- [ ] *Lưu ý:* nếu chọn B, cân nhắc thay `firebase_storage` bằng Supabase đã dùng cho audio để giảm 2 backend (hoặc chuyển hết sang Firebase Storage).

**Deliverable:** v2.0 theo hướng chọn.

---

### 🛍 Giai đoạn 5 — “Phát hành & Tăng trưởng” (dọc các giai đoạn)

- [ ] Google Play: privacy policy, content rating, AAB đã build sẵn trong CI, staged rollout.
- [ ] App Store: cần Apple Developer + entitlements sideload → bản TestFlight.
- [ ] F-Droid/GitHub Releases song song (workflow hiện đã tạo release khi tag `v*`).
- [ ] Analytics bảo mật nhẹ (ví dụ **PostHog self‑host / Plausible** hoặc chỉ log cục bộ) để biết user rơi ở phase nào — **không** spam Firebase nếu chưa dùng.
- [ ] ASO: tên “VipLang – TOEIC 13 chủ đề”, screenshot 5 phase.

---

## 5. Ma trận ưu tiên (đề xuất thứ tự làm)

```
P0 (tuần này)   │ R1 unlock 12/13 · R3 analyze+test CI · R2 app ID + signing
                 │ R7 download retry · gỡ dependency chết (R8) · README (R9)
P1 (sau v1.1)   │ Settings + tải lại audio · Onboarding + UserGoal
                 │ fl_chart progress · streak freeze · notifications
P2 (khi sẵn sàng)│ Content bundle remote · go_router · dark mode · backup/restore
P3 (chiến lược)  │ Auth + sync · store listing · analytics
```

---

## 6. Câu hỏi cần quyết trước khi làm tiếp

1. **ID ứng dụng thật** (`com.viplang.app` hay `com.pabhassaracitto.viplang`…) — đổi sớm trước khi có user.
2. **Hướng Giai đoạn 4:** A (content remote, giữ local‑first) hay B (Firebase sync)?
3. **Mục tiêu phát hành:** chỉ distribute APK/GitHub, hay thật sự lên **Google Play** trong quý này? (ảnh hưởng việc ký release & privacy policy).
4. **Ngôn ngữ UI:** giữ tiếng Việt hardcode hay thêm i18n (en) cho người học nước ngoài?

---

*File này nên được review định kỳ sau mỗi milestone. Cập nhật checkbox theo tiến độ thực tế.*
