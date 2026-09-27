# Ký release Android cho VipLang (keystore + GitHub Secrets)

> **Dành cho:** chủ app (bạn). Làm **một lần**, sau đó mọi bản release đều ký tự động trên GitHub Actions.
>
> **Quan trọng:** file keystore (`.jks`) **không được mất** và **không được commit** lên Git.
> Nếu mất, bạn **không thể cập nhật** app đã phát hành trên Google Play nữa (phải phát hành app mới với ID mới).
> Hãy lưu file `.jks` + mật khẩu vào nơi an toàn (ví dụ: Google Drive riêng tư + USB dự phòng, hoặc trình quản lý mật khẩu).

---

## 0. Điều kiện

- Máy có **Java (JDK)** — thường đã có sẵn nếu bạn cài Android Studio.
  Kiểm tra: mở Terminal / PowerShell gõ `keytool -help` → nếu hiện hướng dẫn là OK.
  - Nếu báo "không tìm thấy lệnh", mở Android Studio → **Settings → Build, Execution, Deployment → Build Tools → Gradle → Gradle JDK**, tìm đường dẫn JDK, rồi dùng đường dẫn đầy đủ tới `keytool`
    (ví dụ Windows: `"C:\Program Files\Android\Android Studio\jbr\bin\keytool.exe"`)
- App ID đã chốt: **`com.viplang.app`** (xem `android/app/build.gradle.kts`).

---

## 1. Tạo keystore (chạy 1 lần trên máy bạn)

```bash
keytool -genkey -v \
  -keystore viplang-release.jks \
  -storetype JKS \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias viplang
```

- `-validity 10000` ≈ 27 năm → không hết hạn trong đời app.
- Khi chạy, công cụ sẽ hỏi:
  1. **Enter keystore password** → đặt mật khẩu mạnh, **ghi lại**.
  2. **Re-enter new password** → nhập lại.
  3. **What is your first and last name?** → tên bạn (hoặc `VipLang`).
  4. **Organizational unit / Organization / City / State / Country code** → điền tuỳ ý (ví dụ `LK`).
  5. **Is CN=... correct?** → gõ `yes`.
  6. **Enter key password for <viplang>** → *nhấn Enter* để dùng chung mật khẩu với keystore (khuyến nghị).

Kết quả: file **`viplang-release.jks`** trong thư mục bạn vừa chạy lệnh.

> `alias` ở trên là `viplang` — dùng đúng alias này ở bước 3.

---

## 2. Mã hoá keystore thành Base64 (để dán vào GitHub Secrets)

**Windows (PowerShell):**

```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes("$PWD\viplang-release.jks")) | Set-Content keystore_base64.txt
```

**macOS / Linux:**

```bash
base64 -i viplang-release.jks | tr -d '\n' > keystore_base64.txt   # macOS
base64 -w 0 viplang-release.jks > keystore_base64.txt              # Linux
```

Mở file `keystore_base64.txt` → nội dung là **một chuỗi rất dài** (hàng nghìn ký tự). **Copy toàn bộ chuỗi** đó.

---

## 3. Khai 4 GitHub Secrets

1. Mở: `https://github.com/Pabhassaracitto/viplang/settings/secrets/actions`
2. Bấm **New repository secret** và tạo lần lượt **4 secret** sau:

| Name (tên secret) | Value (giá trị) |
|---|---|
| `KEYSTORE_BASE64` | Chuỗi Base64 vừa copy ở bước 2 |
| `KEYSTORE_PASSWORD` | Mật khẩu keystore bạn đặt ở bước 1 |
| `KEY_ALIAS` | `viplang` |
| `KEY_PASSWORD` | Mật khẩu của key (nếu ở bước 1 bạn nhấn Enter thì **giống** mật khẩu keystore) |

> ⚠️ Tên secret phải **giống hệt** (chữ in hoa, dấu gạch dưới). Sai tên → CI sẽ build bản **debug-signed** thay vì bản ký thật.
> Không cần tạo secret `KEYSTORE_PATH` — workflow tự sinh file.

---

## 4. Workflow làm gì với các secret này?

`.github/workflows/full_build.yml` có bước **"Decode keystore (optional)"**:

1. Nếu **có** secret `KEYSTORE_BASE64` → giải mã ra `android/app/viplang-release.jks` + sinh file `android/key.properties` (chứa storePassword/keyPassword/keyAlias) → Gradle ký bằng **release key thật**.
2. Nếu **không có** secret → bỏ qua bước này, Gradle tự **fallback ký bằng debug key** (app vẫn build được để test, nhưng **không upload Play Store được**).

Chạy build: **Actions → "Full Build (Android / iOS / Windows / Linux)" → Run workflow** (chọn nhánh/tag), hoặc đơn giản là push một **tag** dạng `v*`:

```bash
git tag v1.1
git push origin v1.1
```

→ CI build 4 nền tảng và **tạo GitHub Release** kèm APK/AAB (bản ký release).

---

## 5. (Tuỳ chọn) Build ký release ngay trên máy bạn

Tạo file `android/key.properties` (**file này đã nằm trong `.gitignore`, không bị commit**):

```properties
storePassword=mat_khau_keystore
keyPassword=mat_khau_key
keyAlias=viplang
storeFile=/duong/dan/tuyet/doi/viplang-release.jks
```

Rồi chạy:

```bash
flutter build appbundle --release     # file .aab để upload Play Store
flutter build apk --release           # file .apk để cài trực tiếp
```

---

## 6. Checklist trước khi phát hành Play Store

- [ ] Đã tạo `viplang-release.jks` + lưu 2 nơi an toàn
- [ ] Đã khai đủ 4 GitHub Secrets
- [ ] Chạy CI và xác nhận log ghi **"keystore decoded"** (không phải "skipping")
- [ ] Kiểm tra APK release: cài lên máy thật → mở app OK, audio phát được
- [ ] Đã bật **Play App Signing** khi tạo app trên Play Console (Google giữ khoá upload của bạn)
- [ ] Có **privacy policy** (URL công khai) + ảnh screenshot + mô tả store listing

---

## 7. Nếu lỡ mất keystore

- **Chưa từng upload Play Store:** tạo keystore mới, khai lại secret — không sao cả.
- **Đã upload Play Store:** bạn vẫn còn đường nếu bật **Play App Signing** (Google giữ app signing key; chỉ cần *upload key* mới — liên hệ Google Play support để **reset upload key**).
  Nếu **không** bật Play App Signing và mất keystore → **không thể** cập nhật app đó nữa.

---

*Xem thêm: `README.md` (mục Release), `.github/workflows/full_build.yml`.*
