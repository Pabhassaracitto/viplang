# Quy trình PR — bảo đảm không lỗi đỏ, không xung đột

> Tài liệu này trả lời câu hỏi: *"Làm sao chắc chắn commit khớp chức năng, và khi mở PR không bị đỏ / không xung đột?"*

---

## 1. Ba tầng bảo đảm

| Tầng | Công cụ | Bảo đảm điều gì | Chạy khi nào |
|---|---|---|---|
| 1 | `tools/pr_guard.sh` | Commit message đúng quy ước · không có dấu xung đột · không lỡ commit keystore/file build · nhánh không lệch sau base | Mở/cập nhật PR, hoặc chạy tay |
| 2 | `.github/workflows/ci.yml` | `flutter analyze` sạch + toàn bộ `flutter test` xanh (hiện **55 test**) | Mọi push & PR |
| 3 | `.github/workflows/android_check.yml` | `flutter build apk --debug` — bắt lỗi Gradle/plugin native mà analyze/test không thấy | Push vào `master`/nhánh phiên, PR có đổi `lib/`/`android/`/`pubspec` |

Cả 3 job đều là **required check** khi bạn bật branch protection (mục 4).

---

## 2. Commit ↔ chức năng

**Quy ước:** `type(scope): mô tả ngắn` — theo Conventional Commits.

| type | Dùng cho |
|---|---|
| `feat` | Tính năng mới |
| `fix` | Sửa lỗi |
| `docs` | Tài liệu (README, PLAN, docs/) |
| `test` | Chỉ thêm/sửa test |
| `ci` | Workflow, script build |
| `build` | `pubspec.yaml`, Gradle, Info.plist |
| `chore` | Việc lặt vặt (dọn dẹp, đổi tên) |
| `refactor`, `perf`, `style` | Tái cấu trúc, tối ưu, định dạng |

- `scope` chỉ dùng **chữ không dấu**: `feat(v1.2)`, `fix(content)`, `ci(android)` — **không** viết `feat(GĐ3)` (script sẽ chặn).
- Mỗi commit = **một** chức năng. Nếu làm nhiều việc, tách commit. Cách kiểm tra nhanh:

```bash
git log --oneline origin/master..HEAD          # xem tiêu đề từng commit
git show --stat <sha>                          # commit này chạm file nào?
tools/pr_guard.sh origin/master HEAD           # kiểm tra tự động
```

- Nhãn `!` cho thay đổi phá vỡ tương thích: `feat(api)!: ...`

**Nhánh hiện tại (PR #1 — Giai đoạn 2 + 3)** đã được tổ chức lại thành 10 commit theo chức năng:

| Commit | Chức năng |
|---|---|
| `feat(v1.1): P0 — …` | Giai đoạn 2: unlock 13 chủ đề, CI, tải audio, Cài đặt, dọn deps |
| `ci: job analyze + test …` | Hạ tầng CI báo lỗi chi tiết |
| `fix(download): sửa singleton …` | Sửa lỗi khởi tạo DownloadService |
| `test(audio): assert trackNum …` | Kiểm tra tham số resolver |
| `fix(content): validator khớp 2 chiều …` | Sửa nội dung theme 8 + validator |
| `docs(plan): CI xanh lần đầu …` | Cập nhật PLAN |
| `feat(v1.2): onboarding …` | Onboarding, mục tiêu, streak freeze, biểu đồ, applicationId |
| `feat(v1.2): dark mode …` | Dark mode, go_router/deep link, nhắc học, audio quiz |
| `ci(android): build apk --debug …` | Build check Android + desugaring |
| `docs: TESTING.md …` | Tài liệu kiểm thử, README, PLAN |

> **Mẹo:** nếu không muốn 10 commit này xuất hiện trong `master`, bật **Squash and merge** (mục 4) — PR sẽ vào `master` thành **1 commit** mang tiêu đề PR.

---

## 3. Vì sao PR này không thể xung đột

```bash
git fetch origin
git merge-base --is-ancestor origin/master HEAD && echo "master là tổ tiên của nhánh → fast-forward, không xung đột"
git merge-tree --write-tree origin/master HEAD >/dev/null && echo "merge thử: sạch"
```

Nhánh được tách từ `95ee25a` và `master` chưa có commit mới ⇒ mọi tệp chỉ bị **một phía** thay đổi ⇒ Git không có gì để xung đột.

**Nếu sau này `master` có commit mới**, làm theo thứ tự:

```bash
git fetch origin
git merge origin/master        # giải quyết xung đột ngay tại máy, KHÔNG để GitHub làm hộ
flutter analyze && flutter test
tools/pr_guard.sh origin/master HEAD
git push
```

---

## 4. Bật branch protection (làm 1 lần, trên GitHub)

**Settings → Branches → Add branch protection rule** (hoặc *Rulesets*), pattern `master`:

1. ✅ **Require a pull request before merging** (bắt buộc review ít nhất 0–1 người).
2. ✅ **Require status checks to pass** → chọn:
   - `flutter analyze & test` (CI)
   - `flutter build apk --debug` (Android build check)
   - `quy ước commit & xung đột` (PR guard)
3. ✅ **Require branches to be up to date before merging** → GitHub tự chặn merge nếu `master` đã đi trước ⇒ **không bao giờ xung đột tại thời điểm merge**.
4. ✅ **Do not allow bypassing the above settings** (kể cả admin).
5. **Settings → General → Pull Requests**: chỉ tick **Allow squash merging** (tắt merge commit / rebase) ⇒ `master` sạch, mỗi PR = 1 commit.

> Sau khi bật mục 3, nút *Merge* sẽ bị khoá cho tới khi các check xanh và nhánh đã cập nhật — đây chính là "bảo đảm" bạn cần.

---

## 5. Quy trình chuẩn cho mỗi lần làm việc

```bash
# 1. Tạo nhánh từ master mới nhất
git checkout master && git pull
git checkout -b feat/ten-chuc-nang

# 2. Làm việc, tách commit theo chức năng
git add -p                # chia nhỏ thay đổi theo từng chức năng
git commit -m "feat(quiz): tự phát audio sau khi chọn đáp án"

# 3. Trước khi mở PR
flutter analyze && flutter test
tools/pr_guard.sh origin/master HEAD

# 4. Push + mở PR (tiêu đề cũng theo Conventional Commits)
git push -u origin feat/ten-chuc-nang
gh pr create --fill      # hoặc điền theo .github/PULL_REQUEST_TEMPLATE.md
```

---

## 6. Checklist "PR xanh" trước khi bấm Create

- [ ] `flutter analyze` không có lỗi (info cũng nên dọn)
- [ ] `flutter test` xanh toàn bộ
- [ ] `tools/pr_guard.sh origin/master HEAD` → **đạt**
- [ ] Tiêu đề PR theo `type(scope): mô tả`
- [ ] Nhánh mới hơn `master` (không lệch sau)
- [ ] Đã điền `.github/PULL_REQUEST_TEMPLATE.md` (bảng commit ↔ chức năng)
- [ ] Nếu đổi UI/audio/thông báo → đã test theo `docs/TESTING.md`
