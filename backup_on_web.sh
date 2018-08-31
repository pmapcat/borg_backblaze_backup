#!/bin/sh

export BORG_PASSPHRASE='***REMOVED***'
# Setting this, so the repo does not need to be given on the commandline:
export BORG_REPO=/home/mik/vm/2018_desktop_borg;
echo "Running backup procedure";
./_backup_engine.sh;
./_web_sync.sh ;
