#!/usr/bin/env bash
# tools/pr_guard.sh — chốt chặn trước khi mở PR.
#
# Kiểm tra:
#   1. Mọi commit trong PR theo Conventional Commits  → type(scope): mô tả
#   2. Không còn dấu xung đột merge (<<<<<<< / >>>>>>> / =======)
#   3. Không lỡ commit bí mật / file build (keystore, key.properties, apk, aab…)
#   4. Cảnh báo khi nhánh đang lệch sau base (dễ phát sinh xung đột sau này)
#
# Cách dùng:
#   tools/pr_guard.sh origin/master HEAD      # chạy tay
#   (trong CI: dùng biến BASE_SHA / HEAD_SHA)

set -uo pipefail

BASE="${1:-${BASE_SHA:-origin/master}}"
HEAD_REF="${2:-${HEAD_SHA:-HEAD}}"
PR_TITLE="${PR_TITLE:-}"

errors=0
warnings=0

red()  { printf '\033[31m%s\033[0m\n' "$*"; }
grn()  { printf '\033[32m%s\033[0m\n' "$*"; }
yel()  { printf '\033[33m%s\033[0m\n' "$*"; }
info() { printf '%s\n' "$*"; }

# ─── 1. Commit message ──────────────────────────────────────────────────────
info ''
info '▶ 1/4 Kiểm tra commit message (Conventional Commits)'

TYPES='feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert'
PATTERN="^($TYPES)(\([A-Za-z0-9_./-]+\))?!?: .{3,}"

commits=$(git rev-list --no-merges "$BASE..$HEAD_REF" 2>/dev/null)
if [ -z "$commits" ]; then
  yel '   (không có commit nào trong khoảng — bỏ qua)'
else
  while IFS= read -r sha; do
    subject=$(git log -1 --format=%s "$sha")
    if ! printf '%s' "$subject" | grep -qE "$PATTERN"; then
      red "   ✗ $(git rev-parse --short "$sha"): $subject"
      errors=$((errors + 1))
    else
      grn "   ✓ $(git rev-parse --short "$sha"): $subject"
    fi
  done <<< "$commits"
fi

# ─── 2. Dấu xung đột merge ──────────────────────────────────────────────────
info ''
info '▶ 2/4 Tìm dấu xung đột merge trong file được track'

conflicts=$(git grep -nE '^(<{7}|={7}|>{7})( |$)' -- . 2>/dev/null | grep -v 'pr_guard.sh' || true)
if [ -n "$conflicts" ]; then
  red '   ✗ Còn dấu xung đột:'
  printf '%s\n' "$conflicts" | sed 's/^/     /'
  errors=$((errors + 1))
else
  grn '   ✓ Không có dấu xung đột'
fi

# ─── 3. Bí mật / file build lỡ commit ───────────────────────────────────────
info ''
info '▶ 3/4 Kiểm tra file không được phép commit'

bad=$(git ls-files \
  | grep -Ei '\.(jks|keystore|apk|aab|ipa|mobileprovision)$|(^|/)key\.properties$|(^|/)google-services\.json$' \
  || true)
if [ -n "$bad" ]; then
  red '   ✗ Có file không nên commit:'
  printf '%s\n' "$bad" | sed 's/^/     /'
  errors=$((errors + 1))
else
  grn '   ✓ Không có keystore / file build lỡ commit'
fi

big=$(git ls-files -z | xargs -0 -I{} sh -c '[ -f "{}" ] && [ "$(wc -c < "{}")" -gt 5242880 ] && echo "{}"' 2>/dev/null || true)
if [ -n "$big" ]; then
  yel '   ⚠ File lớn hơn 5 MB:'
  printf '%s\n' "$big" | sed 's/^/     /'
  warnings=$((warnings + 1))
fi

# ─── 4. Nhánh có lệch sau base không ────────────────────────────────────────
info ''
info '▶ 4/4 Kiểm tra nhánh so với nhánh đích'

behind=$(git rev-list --count "$HEAD_REF..$BASE" 2>/dev/null || echo 0)
ahead=$(git rev-list --count "$BASE..$HEAD_REF" 2>/dev/null || echo 0)
info "   Nhánh hơn base: $ahead commit · base hơn nhánh: $behind commit"

if [ "$behind" -gt 0 ]; then
  yel '   ⚠ Base đã có commit mới → nên merge base vào nhánh trước khi mở PR:'
  yel '     git fetch origin && git merge origin/master'
  warnings=$((warnings + 1))
else
  grn '   ✓ Nhánh đang mới hơn base (không thể xung đột lúc này)'
fi

# ─── Kết luận ───────────────────────────────────────────────────────────────
info ''
info '─────────────────────────────────────────────'
if [ -n "$PR_TITLE" ]; then
  if printf '%s' "$PR_TITLE" | grep -qE "$PATTERN"; then
    grn "✓ Tiêu đề PR hợp lệ: $PR_TITLE"
  else
    red "✗ Tiêu đề PR chưa đúng quy ước: $PR_TITLE"
    errors=$((errors + 1))
  fi
fi

if [ "$errors" -gt 0 ]; then
  red "KẾT QUẢ: $errors lỗi, $warnings cảnh báo — CHƯA sẵn sàng mở PR"
  exit 1
fi

grn "KẾT QUẢ: đạt ($warnings cảnh báo) — sẵn sàng mở PR ✅"
exit 0
