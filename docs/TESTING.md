# Kiểm thử VipLang — tự động & thủ công

## 1. Tự động (chạy trên GitHub Actions mỗi lần push)

| Workflow | Nội dung |
|---|---|
| `.github/workflows/ci.yml` | `flutter analyze` + `flutter test` (55 test) |
| `.github/workflows/android_check.yml` | `flutter build apk --debug` — bắt lỗi Gradle/plugin native |
| `.github/workflows/full_build.yml` | Build đủ 4 nền tảng + tạo Release khi push tag `v*` |

Chạy tại máy:

```bash
flutter analyze
flutter test
flutter test test/core/services/streak_service_test.dart   # 1 file
flutter test --coverage                                    # + coverage/lcov.info
```

**Các bộ test hiện có**

| File | Nội dung |
|---|---|
| `test/core/utils/srs_algorithm_test.dart` | Thuật toán SM-2: wrong/good/easy, sàn EF 1.3, interval, retention |
| `test/core/services/streak_service_test.dart` | Streak + đóng băng (1 lượt/tuần, reset theo tuần), `StudyLog` XP theo ngày |
| `test/core/services/app_settings_test.dart` | Chế độ giao diện, giờ nhắc, `nextOccurrence`, `AppColors` sáng/tối |
| `test/core/services/audio_path_resolver_test.dart` | 52 file audio, công thức tên file, lỗi tham số |
| `test/data/content/content_validator_test.dart` | 13 theme × 2 ngày: cấu trúc phase, mixedSegments ↔ fabAnswers, quiz bounds |
| `test/widget_test.dart` | Smoke test màn danh sách chủ đề |

---

## 2. Kiểm thử thủ công trên máy thật (không CI nào làm được)

### 2.1. Giao diện tối/sáng

1. Mở app → **avatar 👤 (góc phải trên)** → mục **Giao diện**.
2. Chọn lần lượt **Sáng / Tối / Theo hệ thống**:
   - Toàn bộ nền, thẻ, chữ phải đổi ngay, **vẫn đang ở màn Cài đặt**.
   - Không có chữ/nền trùng màu (không đọc được).
3. Chế độ **Theo hệ thống**: bật/tắt Dark Mode của điện thoại → app đổi theo.
4. Tắt app, mở lại → giao diện vẫn đúng lựa chọn đã lưu.

### 2.2. Nhắc học hằng ngày

> Chỉ hỗ trợ **Android / iOS**. Trên Windows/Linux công tắc sẽ bị mờ (không hỗ trợ).

1. Cài đặt → **Nhắc học** → bật công tắc → **cho phép thông báo** khi hệ thống hỏi.
2. Đổi giờ về **1–2 phút sau thời điểm hiện tại** (dùng "Đổi giờ nhắc").
3. Khoá màn hình/để app ở nền → chờ tới giờ → **phải có thông báo**.
4. Tắt app hoàn toàn (không chỉ ẩn) rồi chờ lại → thông báo vẫn phải tới (Android: nhờ `zonedSchedule` + receiver boot).
5. Bấm **tắt công tắc** → không nhận thông báo nữa.
6. Android 13+: từ chối quyền → app phải hiện SnackBar nhắc, công tắc **không** bật.

Kiểm tra nhanh danh sách thông báo đã hẹn (Android):

```bash
adb shell dumpsys notification --noredact | grep -i viplang
```

### 2.3. Deep link

```bash
# Android
adb shell am start -a android.intent.action.VIEW -d "viplang://theme/05/day/2"

# iOS (Simulator)
xcrun simctl openurl booted "viplang://theme/05/day/2"
```

Kỳ vọng: app mở thẳng **Chủ đề 5 – Entertainment, Day 2**. Thử thêm:

| Link | Kết quả |
|---|---|
| `viplang://theme/13/day/2` | Health – Day 2 |
| `viplang://theme/99/day/1` | Màn "Không tìm thấy chủ đề số 99" + nút về Trang chủ |
| `viplang://lien-tinh-te` | Màn lỗi đường dẫn + nút về Trang chủ |

### 2.4. Streak & đóng băng

1. Học xong 1 bài trong ngày → Home hiện **1 ngày streak**, mục tiêu "Học bài" tích ✅.
2. Đổi ngày hệ thống của máy +2 ngày → mở app: Home hiện gợi ý **"dùng ❄️ để cứu chuỗi"**, Cài đặt hiện **còn 1 lượt/tuần**.
3. Học lại 1 bài → streak **tăng 1** (không reset) và lượt đóng băng về 0.
4. Đổi tiếp +2 ngày nữa rồi học → streak **reset về 1** (đã hết lượt trong tuần).

### 2.5. Audio quiz (nghe hiểu)

1. Vào Chủ đề 1 → Day 1 → phase **Quiz**.
2. Khi vào câu hỏi → audio **tự phát**; bấm **↻ Nghe lại** → phát lại.
3. Chọn đáp án (đúng hoặc sai) → audio **tự phát lại cả câu**, transcript hiện ra.
4. Bật máy bay + chưa tải audio → hiện nút tải; tải xong phát lại được.

### 2.6. Biểu đồ tiến độ

1. Tab **Tiến độ** → thấy heatmap 7 ngày, line chart XP, tổng/trung bình tuần.
2. Học xong một bài → XP hôm nay tăng ngay ở cả heatmap và chart.
3. Chưa đặt mục tiêu → thẻ **🎯 Chưa đặt mục tiêu** hiện nút "Đặt mục tiêu học tập".

---

## 3. Trước khi phát hành

- [ ] Chạy `full_build.yml` với tag `v*` và xác nhận APK **ký bằng release key** (xem `docs/KEYSTORE.md`).
- [ ] Cài APK trên máy thật: mở app, đăng nhập không cần, học 1 bài, nghe audio, bật nhắc học.
- [ ] Kiểm tra màn hình nhỏ (5") và chữ lớn (Accessibility → Font size 1.3×).
- [ ] Kiểm tra có mạng yếu (bật chế độ 3G) → tải audio có retry, không treo app.
- [ ] Xoá app rồi cài lại → onboarding hiện lại, tiến độ cũ đã xoá đúng như mong đợi.
