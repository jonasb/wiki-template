#!/bin/bash
set -e -u

THIS_DIR="$(cd "$(dirname "$0")" > /dev/null; pwd)"
ROOT_DIR="$THIS_DIR/.."

watchman watch "$ROOT_DIR"
watchman -- trigger "$ROOT_DIR" updatewiki '*' -- "$THIS_DIR/update.sh"
