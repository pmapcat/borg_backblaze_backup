#!/bin/sh

export BORG_PASSPHRASE='***REMOVED***'
echo "Mounting backup drive to /home/mik/otherfs"
mount -L backup_drive /home/mik/otherfs;
# Setting this, so the repo does not need to be given on the commandline:
export BORG_REPO=/home/mik/otherfs/2018_desktop_borg;
./_backup_engine.sh;
