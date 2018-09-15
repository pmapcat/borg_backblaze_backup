#!/bin/sh


if ! [ $(id -u) = 0 ]; then
    echo "This script must be run as root" ;
    exit 1;
fi

echo "Setting up credentials"
export BORG_EXCLUDEFILE="_ignore";
export BORG_PASSPHRASE='***REMOVED***';
export BORG_FOLDER_NAME='2018_desktop_borg';
export BORG_DESKTOP="/home/mik/vm/$BORG_FOLDER_NAME";
export REMOTE_DIR="/home/mik/otherfs";
export BACKUP_DRIVE_LABEL="backup_drive";
export REMOTE_PATH="$REMOTE_DIR/$BORG_FOLDER_NAME";
export BACKUP_DIR="/";
echo "BORG DESKTOP IS: $BORG_DESKTOP";



