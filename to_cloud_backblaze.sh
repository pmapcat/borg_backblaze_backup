#!/bin/sh
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @ Copyright (c) Michael Leachim                                                      @
# @ You can find additional information regarding licensing of this work in LICENSE.md @
# @ You must not remove this notice, or any other, from this software.                 @
# @ All rights reserved.                                                               @
# @@@@@@ At 2018-30-09 17:14 <mklimoff222@gmail.com> @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
if ! [ $(id -u) = 0 ]; then
    echo "This script must be run as root" ;
    exit 1;
fi

# cd to script dir
cd $(dirname "$0");

. ./_config.sh;
export BORG_REPO=$BORG_DESKTOP/
echo "Starting web synchronization on: $BORG_REPO";
rclone sync $BORG_REPO $BACKBLAZE_PATH  --progress;
echo "Finished WEB synchronization procedure";

