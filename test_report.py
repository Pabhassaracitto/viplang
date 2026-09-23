#!/usr/bin/env python3
"""Emit GitHub Actions annotations from flutter test output (CI debug aid)."""
import re
import sys

path = sys.argv[1] if len(sys.argv) > 1 else "test_out.txt"
try:
    body = open(path, encoding="utf-8", errors="replace").read()
except OSError as e:
    print(f"::error::Cannot read {path}: {e}")
    sys.exit(0)

lines = body.splitlines()

# Ghép các cụm lỗi: từ dòng có [E] cho tới dòng trống kế tiếp
failures = []
i = 0
while i < len(lines):
    if "[E]" in lines[i] or "Failed to load" in lines[i] or "Some tests failed" in lines[i]:
        chunk = [lines[i]]
        j = i + 1
        while j < len(lines) and lines[j].strip() and j < i + 40:
            chunk.append(lines[j])
            j += 1
        failures.append("\n".join(chunk))
        i = j
    else:
        i += 1

if not failures:
    # fallback: 60 dòng cuối
    failures = ["\n".join(lines[-60:])]

for n, f in enumerate(failures[:15], 1):
    msg = f.replace("%", "%25").replace("\r", "%0D").replace("\n", "%0A")
    print(f"::error title=Test failure {n}::{msg}")

# Summary totals
for l in lines:
    if re.search(r"Some tests failed|All tests passed|\d+ - \d+ tests?", l):
        m = l.replace("%", "%25").replace("\n", "%0A")
        print(f"::notice::{m}")

print(f"::notice::failures_emitted={min(len(failures), 15)} total_chunks={len(failures)}")
