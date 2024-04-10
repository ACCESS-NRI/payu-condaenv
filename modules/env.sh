#!/bin/bash
# Prints the environment variables when activating un-packed environment
export PATH=/usr/bin:/bin

name=$1
is_prerelease=$2

if [ "$is_prerelease" = true ]; then
    # Use prerelease location for apps
    source /g/data/vk83/prerelease/apps/$name/bin/activate
else
    # Use release location for apps
    source /g/data/vk83/apps/$name/bin/activate
fi
/bin/env