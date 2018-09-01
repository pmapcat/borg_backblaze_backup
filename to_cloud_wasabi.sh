#!/bin/sh

if ! [ $(id -u) = 0 ]; then
    echo "This script must be run as root" ;
    exit 1;
fi

. ./_borg_credentials.sh;
export BORG_REPO=$BORG_DESKTOP
echo "Starting web synchronization on: $BORG_REPO";
rclone sync $BORG_REPO  wasabi:dekstop_borg  --progress;
echo "Finished WEB synchronization procedure";
