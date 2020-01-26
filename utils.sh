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
    local status_code=$?

    if [ ${status_code} -ne 0 ]; then
        echo "status code = ${status_code} message: ${1}"
        exit ${status_code};
    fi
}

goto_script_dir() {
    # 1. Store current working directory
    # 2. Get absolute path of the running script
    # 3. Change to that directory so you're running from a known location
    # 4. Return initial working directory so you can return back to it
    # NOTE: Perl usage to be more consistent across Mac / Linux
    # Usage example:
    # goto_script_dir variable_to_store_pwd
    # <do things>
    # cd ${variable_to_store_pwd}

    local resultvar=$1
    local current=$PWD
    echo "storing current working dir: ${current}"

    local script_abs_path=`perl -e 'use Cwd "abs_path";print abs_path(shift)' $0`
    local script_dir=`dirname ${script_abs_path}`
    echo "script dir: ${script_dir}"

    eval $resultvar="${current}"
}

