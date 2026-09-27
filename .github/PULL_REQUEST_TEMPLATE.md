<!--
Cảm ơn bạn đã đóng góp cho VipLang!
Điền đủ các mục dưới đây — CI (`PR guard`) sẽ kiểm tra tiêu đề PR và commit message.
-->

## Mục tiêu

<!-- PR này giải quyết việc gì? (1–3 câu) -->

## Commit ↔ chức năng

<!-- Kiểm tra: mỗi commit chỉ nên thuộc MỘT chức năng và theo Conventional Commits -->

| # | Commit | Chức năng | File chính |
|---|---|---|---|
| 1 | `feat(...): ...` | | |
| 2 | | | |

## Đã kiểm thử

- [ ] `flutter analyze` — không có lỗi mới
- [ ] `flutter test` — tất cả test xanh
- [ ] `tools/pr_guard.sh origin/master HEAD` — đạt
- [ ] Test trên máy thật (nếu có đổi UI/audio/thông báo): ………………………………

## Rủi ro & ảnh hưởng

- [ ] Có thay đổi dữ liệu Hive (thêm field/adapter) — đã cân nhắc dữ liệu người dùng cũ
- [ ] Có thay đổi quyền/nền tảng (Android/iOS/desktop)
- [ ] Có thay đổi phụ thuộc (`pubspec.yaml`)
- [ ] Không có rủi ro đáng kể

## Ghi chú cho người review

<!-- Điểm cần chú ý, phần đã cố tình để lại, việc cần làm tiếp -->
