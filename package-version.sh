#!/usr/bin/env bash
# Package Version
#
# List versioning information for a given debian package
# Usage example:
# package-version.sh my-fancy-debian
#

apt-cache policy "${@}"

echo
echo 

# TODO: Make this optional
dpkg -s "${@}"


