#!/usr/bin/env bash
# Enable trailing slashes completion after symlinks
# Thanks to https://atp.fm
# Original link: https://unix.stackexchange.com/questions/275883/add-trailing-slash-in-bash-completion-of-directory-symbolic-links

OPTION="set mark-symlinked-directories on"
INPUT_RC="${HOME}/.inputrc"

echo "checking if '${OPTION}' exists in ${INPUT_RC}"

touch ${INPUT_RC}

if grep -q "${OPTION}" "${INPUT_RC}"; then
    echo "${INPUT_RC} contains '${OPTION}' so there is noting to do"
else
    echo "${INPUT_RC} is missing '${OPTION}' so adding it"
    echo ${OPTION} > ${INPUT_RC}
fi

echo "done"
