#!/usr/bin/env bash
# For a given (or current) directory list the audio files
# and whether they are DRM or not. This was created primarily
# to check files I may have had in Apple Music and then purchased
# or vice versa.

ROOT=""

if [[ -n "${1}" ]]; then
    echo "Checking ${1} for DRM'ed audio files"
    if [[ "${filename: -1}" == "/" ]]; then
        ROOT="${1}"
    else
        ROOT="${1}/"
    fi
fi

for filepath in "${ROOT}"*.{m4a,mp3}; do
    kind="$(mdls "${filepath}" | grep kMDItemKind)"
    filename=$(basename "${filepath}")
    # For me at least, there is an ugly 24 whitespace chars in the ouput
    # so replace 12 with 1. This will take 24 down to 2 which is nicer
    # and still strip some should others get a different count
    echo -e "${filename}: ${kind//            / }"
done
