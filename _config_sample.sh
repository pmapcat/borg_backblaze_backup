#!/bin/sh
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @ Copyright (c) Michael Leachim                                                      @
# @ You can find additional information regarding licensing of this work in LICENSE.md @
# @ You must not remove this notice, or any other, from this software.                 @
# @ All rights reserved.                                                               @
# @@@@@@ At 2018-12-10 19:41 <mklimoff222@gmail.com> @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

if ! [ $(id -u) = 0 ]; then
    echo "This script must be run as root" ;
    exit 1;
fi
# @@@@@@@@@@@@@@@@@@@@@ GENERAL SETTINGS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
export BACKUP_DIR="/";

# @@@@@@@@@@@@@@@@@@@@@ BORG ARCHIVE @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# pass phrase for borg backup
export BORG_PASSPHRASE='Your Pass Phrase Here';
# borg folder name
export BORG_FOLDER_NAME='2018_desktop_borg';
# directory where to put Borg backup repo.
#  (Keep in mind, it might require a lot of space, as a rule of thumb, 1/3 of entire backup amount should be enough)
export BORG_DESKTOP="/home/mik/vm/$BORG_FOLDER_NAME";
export BORG_EXCLUDEFILE="_ignore";

# @@@@@@@@@@@@@@@@@@@@@ EXTERNAL HDD @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# place where external HDD should be mounted (for script: to_external_hdd.sh)
export REMOTE_DIR="/home/mik/otherfs";

# label of the backup drive 
export BACKUP_DRIVE_LABEL="backup_drive";
# name of the directory on the remote media 
export REMOTE_PATH="$REMOTE_DIR/$BORG_FOLDER_NAME";

# @@@@@@@@@@@@@@@@@@@@@ CLOUD SETUP @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

## Setting up cloud. Make new remote with the eitehr (backblaze|wasabi) name
export BACKBLAZE_PATH="backblaze:mik-desktop-borg-bucket-for-backup"
export WASABI_PATH="wasabi:dekstop_borg"

echo "BORG DESKTOP IS: $BORG_DESKTOP";
