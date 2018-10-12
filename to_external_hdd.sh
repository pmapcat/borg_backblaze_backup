#!/bin/sh

# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	 
# @ Copyright (c) Michael Leachim                                                      @
# @ You can find additional information regarding licensing of this work in LICENSE.md @
# @ You must not remove this notice, or any other, from this software.                 @
# @ All rights reserved.                                                               @
# @@@@@@ At 2018-01-09 23:37<mklimoff222@gmail.com> @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# This will backup data from this machine on an external HDD drive.
# External drive must have the label that is $BACKUP_DRIVE_LABEL = "backup_drive";

## check root
if ! [ $(id -u) = 0 ]; then
    echo "This script must be run as root" ;
    exit 1;
fi

# cd to script dir
cd $(dirname "$0");


## import env
. ./_config.sh;

export BORG_REPO=$REMOTE_PATH 
echo "Borg repo is on: $BORG_REPO";
## mount disk if not mounted
if ! mount | grep $REMOTE_DIR > /dev/null; then
    echo "Mounting backup drive to $REMOTE_DIR, because it wasn't mounted before";
    mount -L $BACKUP_DRIVE_LABEL $REMOTE_DIR;
    # in case mounting didn't work as expected
    if ! mount | grep $REMOTE_DIR > /dev/null; then
        echo "Mounting didn't run successfully:aborting procedure";
        exit 1;
    fi
fi

## implement backup procedure
. ./_backup_engine.sh;
echo "Backup complete. Unmounting external drive";
umount $REMOTE_DIR; 
