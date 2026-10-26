#!/bin/bash
# devicectl の端末の ID から、xcodebuild の宛先に使う UDID を出力する (xcodebuild は devicectl の ID を宛先として受け付けない)
set -euo pipefail
json=$(mktemp)
trap 'rm -f "$json"' EXIT
xcrun devicectl device info details --device "$1" --json-output "$json" >/dev/null
plutil -extract result.hardwareProperties.udid raw -o - "$json"
