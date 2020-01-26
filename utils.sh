#!/usr/bin/env bash
# Utilities
#
# Primarily a list of functions which should be included in othe scripts
#

in_array() {
    # Determine if a value is in an array
    # Usage Example:
    # Array = arr=("1", "2", "3")
    # if in_array "2" "${arr[@]}"; then...

    # TODO: if there isn't something available already add 'get_from_array' sort of function
    local seeking=$1; shift
    local in=1

    for element; do
        if [[ $element == "$seeking" ]]; then
            in=0
            break
        fi
    done

    return $in
}

check_error() {
    # Check if previous command errored
    # Show message then exit
    # Usage Example:
    # check_error "my previous function failed"

    # TODO: optional carry on or exit immediately
    # TODO: possibly pass in clean up functions?
    status_code=$?

    if [ ${status_code} -ne 0 ]; then
        echo "status code = ${status_code} message: ${1}"
        exit ${status_code};
    fi
}


