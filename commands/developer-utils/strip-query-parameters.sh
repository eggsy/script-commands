#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Strip Query Parameters
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔗
# @raycast.packageName Developer Utils

# Documentation:
# @raycast.description Script query parameters from the URLs copied to your clipboard.
# @raycast.author eggsy
# @raycast.authorURL https://eggsy.xyz

strip_query_parameters() {
  local url="$1"
  local stripped_url="${url%%\?*}"
  echo "$stripped_url"
}

if [[ $(pbpaste) =~ ^https?:// ]]; then
  strip_query_parameters $(pbpaste) | pbcopy
  echo "Stripped query parameters from the URL"
else
  echo "No URL found in clipboard"
  exit 1
fi
