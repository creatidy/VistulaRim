#!/usr/bin/env sh
set -eu

fail=0

say() {
  printf '%s\n' "$*"
}

check() {
  name="$1"
  pattern="$2"

  matches="$(git ls-files | grep -E -i "$pattern" || true)"
  if [ -n "$matches" ]; then
    say "FAIL: $name"
    say "$matches"
    say ""
    fail=1
  fi
}

check "Generated output directories and tool outputs" '(^|/)(DynDOLOD[_ -]?Output|TexGen[_ -]?Output|xLODGen[_ -]?Output|GrassCache|ShaderCache|Overwrite|SSEEdit Backups|NetScriptFramework|Crash Logs)(/|$)'
check "Common generated plugins and markers" '(^|/)(DynDOLOD\.esm|DynDOLOD\.esp|Occlusion\.esp|FNIS\.esp|FNIS.*\.esp)(/|$)'
check "Logs and dumps" '\.(log|dmp)$'

if [ "$fail" -ne 0 ]; then
  say "Generated outputs must not be committed to this repo."
  say "See: docs/generated-outputs-policy.md"
  exit 1
fi

say "OK: no tracked generated outputs found."

