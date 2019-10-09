#!/bin/bash
set -e -u

THIS_DIR="$(cd "$(dirname "$0")" > /dev/null; pwd)"

(
cd "$THIS_DIR/.."

if [ -d "$(git rev-parse --git-path rebase-merge)" ] || [ -d "$(git rev-parse --git-path rebase-apply)" ]; then
 >&2 echo "Is currently rebasing, please resolve."
 exit 1
fi

if [ -n "$(git status --porcelain)" ]; then
  # Existing changes
  git add .
  EDITED_FILES="$(git status -s --porcelain | cut -c4- | awk 'ORS=", "' | sed 's/, $//')"
  TRUNCATED_EDITED_FILES="$(echo -n "$EDITED_FILES" | sed -E "s/(.{${1-100}}).*$/\1.../")"
  git commit -m "${TRUNCATED_EDITED_FILES}"
fi
git pull --rebase
git push
)
