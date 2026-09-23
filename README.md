# VIPLANG — Học tiếng Anh theo phương pháp Do Thái

**VipLang** là app Flutter học tiếng Anh giao tiếp/workplace theo **13 chủ đề TOEIC**, thiết kế theo phương pháp "Do Thái" — học sâu từng câu, luyện nghe hiểu, dịch Anh–Việt, mind game điền chỗ trống và ôn tập spaced repetition (SM-2).

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue) ![Release](https://img.shields.io/badge/release-v1.1-brightgreen) ![License](https://img.shields.io/badge/license-private-red)

## ✨ Tính năng chính

| Tính năng | Mô tả |
|---|---|
| 📖 **13 chủ đề × 2 ngày** | Offices → Health, tổng 26 bài học, 556+ từ vựng |
| 🎧 **5 phase / bài** | Đọc–nghe · Từ vựng · Dịch · Mind game · Quiz nghe |
| 🔁 **Ôn tập SRS** | Thuật toán SM-2, flashcard đến hạn, TTS đọc từ |
| 📊 **Tiến độ** | Streak, XP, badge, % mỗi chủ đề, unlock tuần tự |
| 🎵 **Audio offline** | Tải 52 track từ Supabase Storage (retry + tải song song), phát ngoại tuyến |
| 🎯 **Mục tiêu & Onboarding** | 3 màn đầu: chào → đặt mục tiêu TOEIC (điểm/phút mỗi ngày/ngày thi) → hướng dẫn 5 phase |
| 📈 **Biểu đồ tiến độ** | Heatmap 7 ngày, line chart XP (`fl_chart`), % từng chủ đề |
| ❄️ **Streak freeze** | 1 lượt/tuần cứu chuỗi khi bỏ lỡ 1 ngày |
| 🔔 **Nhắc học hằng ngày** | Local notification theo giờ tự chọn (không cần server) |
| 🌗 **Sáng / Tối / Theo hệ thống** | Chọn trong Cài đặt |
| ⚙️ **Cài đặt** | Audio, TTS, tốc độ phát, nhắc học, giao diện, reset tiến độ |

## 📸 Màn hình chính

- **Onboarding** — chào → mục tiêu → cách học (chỉ hiện lần đầu)
- **Splash** — kiểm tra & tải audio lần đầu (cho phép bỏ qua)
- **Home** — streak thật, mục tiêu hôm nay, từ vựng hôm nay, hành động nhanh
- **13 Chủ đề** — danh sách theme khóa/mở theo tiến độ
- **Bài học** — 5 phase với audio player (tự phát + nghe lại), mixed-text mind game
- **Ôn tập** — SRS review due cards, badge số từ đến hạn
- **Tiến độ** — mục tiêu, heatmap/line chart, 13 bí mật, huy hiệu
- **Cài đặt** — giao diện, nhắc học, audio, TTS, mục tiêu, reset

Ngoài ra app hỗ trợ **deep link**: `viplang://theme/05/day/2` mở thẳng bài học.

> Hướng dẫn kiểm thử (tự động + thủ công): [`docs/TESTING.md`](docs/TESTING.md)
> Ký release Android: [`docs/KEYSTORE.md`](docs/KEYSTORE.md)

## 🛠️ Phát triển

### Yêu cầu

- Flutter stable ≥ 3.10 (Dart ≥ 3.10)
- Android Studio / Xcode (nếu build native)

### Chạy local

```bash
# Tạo thư mục asset trống (repo không commit audio)
mkdir -p assets/animations assets/audio assets/data

flutter pub get
flutter run
```

### Kiểm thử & analyze

```bash
flutter analyze --no-fatal-infos
flutter test
```

CI (`.github/workflows/ci.yml`) tự chạy analyze + test trên mỗi push/PR.

### Build release

```bash
# Android APK (CI cũng build qua GitHub Actions khi tag v*)
flutter build apk --release --target-platform android-arm64

# Đổi tên package ID trước khi lên Play Store:
# 1. Sửa applicationId trong android/app/build.gradle.kts
# 2. Cấu hình ký release: tạo android/key.properties (xem mẫu dưới)

# iOS (cần macOS)
flutter build ios --release --no-codesign
```

#### Ký release Android (`android/key.properties`)

```properties
storePassword=<mật khẩu keystore>
keyPassword=<mật khẩu key>
keyAlias=<tên key>
storeFile=<đường dẫn.keystore>
```

File này nằm trong `.gitignore` — **không commit**. CI dùng GitHub Secrets `KEYSTORE_BASE64` + `KEYSTORE_PASSWORD` + `KEY_ALIAS` + `KEY_PASSWORD`.

## 🏗️ Kiến trúc

```
lib/
├── core/
│   ├── constants/     # AppColors, AppTextStyles, AppConstants
│   ├── services/      # Hive, Download (Supabase), TTS, SafeAudio, AudioPathResolver
│   └── utils/         # SrsAlgorithm (SM-2)
├── data/
│   ├── content/       # 13 file nội dung (theme1..13) + ContentValidator + Registry
│   └── models/        # Theme, Vocab, Lesson, UserProgress (Hive TypeAdapter)
└── presentation/
    ├── blocs/         # ThemeBloc, LessonBloc, MindGameBloc, ProgressBloc
    ├── screens/       # splash, home, themes, lesson (+5 phases), progress, vocab, settings
    └── widgets/       # audio player, mixed text, vocab of the day...
```

**Nguyên tắc:**

- **Local-first** — tiến độ lưu Hive, không bắt buộc tài khoản
- **Một nguồn sự thật cho nội dung** — `AllThemesRegistry` (metadata theme, lesson, vocab)
- **Audio path tập trung** — `AudioPathResolver` (52 file whitelist trên Supabase)
- **Validate nội dung** — `ContentValidator` chạy trong test CI (26 LessonDay)

## 📦 Phát hành

1. Cập nhật `version:` trong `pubspec.yaml` (vd. `1.1.0+2`)
2. `git tag v1.1 && git push origin v1.1`
3. GitHub Actions (`.github/workflows/full_build.yml`) build Android / iOS / Windows / Linux
4. Release tự tạo với artifact đính kèm

## 📋 Lộ trình

Xem [PLAN.md](PLAN.md) — tiến độ hiện tại, rủi ro kỹ thuật và các giai đoạn tiếp theo.

## 📄 License

Dự án riêng — không công khai.
