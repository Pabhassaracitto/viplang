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

## 5. Thứ tự ưu tiên nguồn nghe trong app

App **luôn ưu tiên MP3 thật**, TTS chỉ là lưới an toàn cuối cùng:

| Ưu tiên | Nguồn | Ghi chú |
|---|---|---|
| 1 | MP3 trong thư mục dữ liệu app | Đã tải về **hoặc** người dùng tự nhập (mục 6) |
| 2 | MP3 đóng gói trong `assets/audio/` | Repo không commit audio nên thường trống |
| 3 | Tải từ mirror (Supabase → GitHub Releases) | Nút cam trên trình phát |
| 4 | Giọng đọc máy (TTS) | Chỉ hiện khi 1–3 đều không dùng được |

Lựa chọn TTS nằm ngay dưới trình phát (`AudioPlayerWidget.ttsText`), đọc hết
bài thì tính là "đã nghe" để mở nút *Tiếp tục*. Tôn trọng công tắc
**Cài đặt → Phát âm → Đọc từ bằng TTS**: nếu người dùng đã tắt, app nhắc bật
lại thay vì im lặng không phát.

## 6. Nhập MP3 có sẵn từ máy (không cần mạng)

**Cài đặt → Dữ liệu âm thanh → Nhập MP3 có sẵn từ máy** cho phép chọn từng
file hoặc cả một thư mục (quét cả thư mục con). File được chép vào đúng thư
mục mà `DownloadService` tìm kiếm nên dùng được ngay, không cần tải lại.

`AudioImportService` tự suy ra track theo số thứ tự đĩa CD gốc (**3–54**, track
01–02 là phần giới thiệu) rồi đổi tên về chuẩn `themeNN_trackMM.mp3`:

| Tên file người dùng chọn | Nhận diện |
|---|---|
| `theme02_track07.mp3` | ✅ track 7 → chủ đề 2 |
| `Track 07.mp3`, `track_07.mp3`, `TRACK-7.mp3` | ✅ track 7 |
| `600 Essential Words - Track 03.mp3` | ✅ track 3 (ưu tiên số sau chữ "track") |
| `07 - General Business.mp3`, `07.mp3`, `Unit 12.mp3` | ✅ số đầu/cuối tên file |
| `01.mp3`, `intro.mp3`, `podcast.mp3` | ❌ bỏ qua, báo lý do cho người dùng |

Công thức: `themeNumber = ((track - 3) ~/ 4) + 1` — xem
`AudioPathResolver.fileNameForAbsoluteTrack`.

File rỗng/quá nhỏ (<1KB) hoặc thực chất là HTML (hay gặp khi tải lỗi) bị loại
và liệt kê trong hộp thoại kết quả. Trên Android, chọn *thư mục* phụ thuộc
Storage Access Framework — nếu không đọc được, app hướng dẫn chuyển sang
*Chọn file MP3…*.

## Karaoke khi chưa có MP3
`KaraokeTextWidget` dùng TTS đọc câu và bộ đếm từ để tô sáng từ đang phát, nên bài học vẫn hoạt động offline khi chưa có MP3. Khi audio thật sẵn sàng, giữ nguyên widget và gọi `setExternalWordIndex(index)` từ listener vị trí của `just_audio` (tính index theo `position / duration * wordCount`), đồng thời tắt `autoStart` để không chạy TTS song song.
