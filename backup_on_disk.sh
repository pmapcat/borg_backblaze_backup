#!/bin/sh

REMOTE_DIR="/home/mik/otherfs/";
BACKUP_DRIVE_LABEL="backup_drive";
export BORG_PASSPHRASE='***REMOVED***';
export BORG_REPO=$REMOTE_DIR/2018_desktop_borg;

echo "Borg repo is on: $BORG_REPO";
if ! mount | grep $REMOTE_DIR > /dev/null; then
    echo "Mounting backup drive to $REMOTE_DIR, because it wasn't mounted before";
    mount -L $BACKUP_DRIVE_LABEL $REMOTE_DIR;
    
    # in case mounting didn't work as expected
    if ! mount | grep $REMOTE_DIR > /dev/null; then
        echo "Mounting didn't run successfully:aborting procedure";
        exit 1;
    fi
fi

./_backup_engine.sh;
