#!/usr/bin/env bash
# tools/upload_audio.sh — upload audio lên GitHub Releases làm mirror dự phòng.
#
# App tải audio theo thứ tự ưu tiên: Supabase Storage → GitHub Releases
# (xem lib/core/services/download_service.dart). Script này đẩy file mp3
# lên release `audio-v1` của repo — khớp với AUDIO_FALLBACK_BASE_URL.
#
# Cách dùng:
#   tools/upload_audio.sh <thư_mục_chứa_mp3> [tag=audio-v1]
#
# Yêu cầu: GitHub CLI (`gh`) đã đăng nhập (`gh auth login`), chạy từ gốc repo.

set -euo pipefail

DIR="${1:-}"
TAG="${2:-audio-v1}"

if [ -z "$DIR" ] || [ ! -d "$DIR" ]; then
  echo "Cách dùng: $0 <thư_mục_chứa_mp3> [tag]" >&2
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "Cần cài GitHub CLI (gh): https://cli.github.com" >&2
  exit 1
fi

REPO="$(gh repo view --json nameWithOwner --jq .nameWithOwner)"

shopt -s nullglob
files=("$DIR"/*.mp3)
if [ "${#files[@]}" -eq 0 ]; then
  echo "Không tìm thấy file .mp3 nào trong: $DIR" >&2
  exit 1
fi

echo "▶ Repo:    $REPO"
echo "▶ Tag:     $TAG"
echo "▶ Số file: ${#files[@]}"

# Tạo release nếu chưa có (latest=false — đây là dữ liệu, không phải bản app)
if ! gh release view "$TAG" --repo "$REPO" >/dev/null 2>&1; then
  echo "▶ Tạo release mới: $TAG"
  gh release create "$TAG" \
    --repo "$REPO" \
    --title "VipLang Audio Data ($TAG)" \
    --notes "52 track audio luyện nghe — mirror dự phòng cho Supabase Storage. Upload bởi tools/upload_audio.sh." \
    --latest=false
fi

echo "▶ Đang upload (có thể mất vài phút)…"
gh release upload "$TAG" "${files[@]}" --repo "$REPO" --clobber

echo "✅ Hoàn tất. Kiểm tra:  gh release view $TAG --repo $REPO"
echo "   URL mẫu: https://github.com/$REPO/releases/download/$TAG/$(basename "${files[0]}")"
