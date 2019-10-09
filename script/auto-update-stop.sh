#!/bin/bash
set -e -u

THIS_DIR="$(cd "$(dirname "$0")" > /dev/null; pwd)"
ROOT_DIR="$THIS_DIR/.."

watchman trigger-del "$ROOT_DIR" updatewiki
