# Phiên bản Web (GitHub Pages)

VipLang chạy được trên trình duyệt. Bản web được build bằng Flutter Web và tự
động publish lên **GitHub Pages** bằng workflow `.github/workflows/web_pages.yml`.

- Địa chỉ: `https://pabhassaracitto.github.io/viplang/`
- Build chạy trên mỗi Pull Request (chỉ kiểm tra) và **deploy khi push vào `master`**.

## 1. Cách hoạt động trên web

| Tính năng | Native (Android/iOS/Desktop) | Web |
|---|---|---|
| Học, bài tập, quiz, mind game | ✅ | ✅ |
| Tiến độ, streak, XP, mục tiêu | ✅ (Hive) | ✅ (lưu trong trình duyệt – IndexedDB) |
| Nghe audio bài học | MP3 đã tải / đã nhập, hoặc tải khi cần | **Phát trực tiếp** từ máy chủ (Supabase → GitHub Releases) |
| Tải toàn bộ audio / xóa audio / nhập MP3 từ máy | ✅ | ❌ (ẩn trong Cài đặt, thay bằng ghi chú) |
| Nhắc học bằng thông báo | ✅ Android/iOS/macOS | ❌ (công tắc bị vô hiệu) |
| Đọc bài bằng giọng máy (TTS) | ✅ | ✅ (Web Speech API của trình duyệt) |
| Dùng offline | ✅ (sau khi tải audio) | ❌ cần mạng để nghe audio |

Lý do: trình duyệt không có hệ thống file, không có thông báo nền như app native.
Mã nguồn tách phần này qua **conditional import**:

- `lib/core/services/local_file_store.dart` → `_io.dart` (native) / `_stub.dart` (web)
- `lib/core/services/notification_service.dart` → `_io.dart` / `_stub.dart`

Mọi file khác KHÔNG được `import 'dart:io'` trực tiếp (sẽ làm hỏng build web).

## 2. Bật GitHub Pages (chỉ làm một lần)

Workflow dùng cơ chế **GitHub Actions** để deploy, nên cần chọn đúng nguồn:

1. Vào **Settings → Pages**.
2. Mục **Build and deployment → Source** chọn **GitHub Actions**.

(Có thể làm bằng CLI: `gh api -X POST repos/<owner>/<repo>/pages -f build_type=workflow`.)

Sau đó merge PR vào `master` → workflow `Web — build & GitHub Pages` chạy và
trang sẽ xuất hiện ở địa chỉ trên.

## 3. Build tại máy

```bash
mkdir -p assets/animations assets/audio assets/data
flutter pub get

# Chạy thử dev (đường dẫn gốc)
flutter run -d chrome

# Build đúng như CI (có tiền tố /viplang/)
flutter build web --release --base-href "/viplang/"
```

Kết quả nằm ở `build/web/`. Muốn xem thử: `cd build/web && python3 -m http.server 8080`
(lưu ý: phải mở bằng đường dẫn có tiền tố `/viplang/` nếu build với `--base-href`).

## 4. Ghi chú kỹ thuật

- **SPA routing**: `go_router` dùng URL dạng `/theme/05/day/2`. GitHub Pages không
  rewrite được, nên workflow copy `index.html` thành `404.html` để F5 trên URL sâu vẫn mở được app.
- **Nguồn audio**: đổi bằng `--dart-define=AUDIO_PRIMARY_BASE_URL=...` và
  `--dart-define=AUDIO_FALLBACK_BASE_URL=...` (cùng cơ chế với native, xem `docs/AUDIO_HOSTING.md`).
- **CORS**: thẻ `<audio>` của trình duyệt phát được file cross-origin mà không cần CORS,
  nên web phát trực tiếp từ Supabase/GitHub không cần cấu hình thêm.
- **Metadata PWA**: `web/manifest.json` và `web/index.html` (tên, màu theme, icon).
