# Audio hosting — mirror ưu tiên Supabase → GitHub Releases

> Tài liệu này giải thích cách app tải audio và cách dựng mirror dự phòng.

## 1. Vì sao cần mirror dự phòng

Trước đây app tải 52 track nghe từ **một nguồn duy nhất** là Supabase Storage.
Khi project Supabase bị pause/xóa (free tier), toàn bộ tính năng tải chết theo
và app báo nhầm *"kiểm tra kết nối mạng"* dù mạng của học viên bình thường.

Từ v1.2, `DownloadService` tải theo **danh sách mirror có thứ tự ưu tiên**:

| Thứ tự | Nguồn | Cấu hình |
|---|---|---|
| 1 | Supabase Storage (nhanh, nguồn gốc) | `AUDIO_PRIMARY_BASE_URL` |
| 2 | GitHub Releases của repo (dự phòng) | `AUDIO_FALLBACK_BASE_URL` |

Nếu mirror ưu tiên lỗi (DNS chết, timeout, 5xx, 404…), app **tự chuyển sang
mirror kế tiếp** trong cùng một lần tải — học viên không phải thao tác gì.

## 2. Upload file lên mirror GitHub Releases

```bash
# 1 lệnh duy nhất — tự tạo release audio-v1 nếu chưa có:
tools/upload_audio.sh /đường/dẫn/tới/thư_mục_mp3
```

Yêu cầu: GitHub CLI (`gh`) đã `gh auth login`, chạy từ gốc repo. Upload lại file
đã có sẽ bị ghi đè (`--clobber`).

URL tải có dạng:

```
https://github.com/Pabhassaracitto/viplang/releases/download/audio-v1/theme01_track03.mp3
```

## 3. Trỏ app sang host khác (không cần sửa code)

Cả 2 mirror đều override được lúc build:

```bash
flutter build apk \
  --dart-define=AUDIO_PRIMARY_BASE_URL=https://supabase-moi.co/storage/v1/object/public/viplang \
  --dart-define=AUDIO_FALLBACK_BASE_URL=https://github.com/<owner>/<repo>/releases/download/audio-v1
```

## 4. Phân loại lỗi hiển thị trên UI

Sau khi thử hết mọi mirror, app báo đúng nguyên nhân (`DownloadErrorKind`):

| Tình huống | Thông báo |
|---|---|
| Mọi mirror đều không kết nối được (socket/DNS) | Kiểm tra kết nối mạng thiết bị |
| Phản hồi quá chậm | Mạng chậm / máy chủ bận, thử lại sau |
| Máy chủ trả 404 | File chưa có trên máy chủ |
| Máy chủ trả 5xx/4xx khác | Máy chủ dữ liệu đang bảo trì (kèm mã lỗi) |

Nguyên tắc: chỉ khi **tất cả** mirror cùng lỗi socket mới kết luận lỗi mạng
phía thiết bị — tránh lặp lại tình trạng báo sai khi máy chủ chết.

## Karaoke khi chưa có MP3
`KaraokeTextWidget` dùng TTS đọc câu và bộ đếm từ để tô sáng từ đang phát, nên bài học vẫn hoạt động offline khi chưa có MP3. Khi audio thật sẵn sàng, giữ nguyên widget và gọi `setExternalWordIndex(index)` từ listener vị trí của `just_audio` (tính index theo `position / duration * wordCount`), đồng thời tắt `autoStart` để không chạy TTS song song.
