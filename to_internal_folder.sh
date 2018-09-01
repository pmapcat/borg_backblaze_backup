#!/bin/sh
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	 
# @ Copyright (c) Michael Leachim                                                      @
# @ You can find additional information regarding licensing of this work in LICENSE.md @
# @ You must not remove this notice, or any other, from this software.                 @
# @ All rights reserved.                                                               @
# @@@@@@ At 2018-01-09 23:40<mklimoff222@gmail.com> @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


## import data for this backup
. ./_borg_credentials.sh;

export BORG_REPO=$BORG_DESKTOP
# Setting this, so the repo does not need to be given on the commandline:
echo "Running backup procedure";
started=$(date '+%d/%m %H:%M)'
. ./_backup_engine.sh;
ended=$(date '+%d/%m %H:%M')
echo "System backup: $started - $ended" > status
