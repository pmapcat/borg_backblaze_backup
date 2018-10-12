# Simple hassle free backup solution that costs less than a $1 a month.

With [Borg](https://borgbackup.readthedocs.io/en/stable/) and [Rclone](https://rclone.org/).

* Data encryption
* Data deduplication
* Incremental backup
* Prunning older versions
* External drive backup
* Cloud backup
* With 3-2-1 system

# Getting started

## Install dependencies

You will need 
* [Borg](https://borgbackup.readthedocs.io/en/stable/)
* [Rclone](https://rclone.org/)
* This repo `git clone github.com/MichaelLeachim/borg_backblaze_backup`

## Configure

Copy configuration:

`mv _config_sample.sh _config.sh`

### Ignore files and directories

Set up which folders to ignore in backup `_ignore`

For example:
```
/proc/*
/boot/*
/cdrom/*
/dev/*
/media/*
/mnt/*
/run/*
/selinux/*
/tmp/*
/var/log/*
/sys/*
/var/*
/var/tmp/*
/var/lib/docker/*
/var/cache/*
/lib/*
```

### Initialize BORG archive

```sh
sudo borg init --encryption=repokey /home/mik/vm/borg.archive/
```

Put these in the config:

```sh
# borg folder name
export BORG_FOLDER_NAME='2018_desktop_borg';
# directory where to put Borg backup repo.
export BORG_DESKTOP="/home/mik/vm/$BORG_FOLDER_NAME";
```

### Initialize and configure Wasabi or BackBlaze

Follow [this](https://rclone.org/b2/) or [this](https://rclone.org/b2/) guide

Set in the config:

```shell
export BACKBLAZE_PATH="backblaze:mik-desktop-borg-bucket-for-backup"
export WASABI_PATH="wasabi:dekstop_borg"
```


## Backing up to external HDD drive

### Configuration
Add label to the external drive 
`sudo e2label /dev/sdc1  backup_drive`

Ensure that your `REMOTE_DIR` exists and is empty. 

Put in the config
```shell
# place where external HDD should be mounted (for script: to_external_hdd.sh)
export REMOTE_DIR="/home/mik/otherfs";

# label of the backup drive 
export BACKUP_DRIVE_LABEL="backup_drive";
# name of the directory on the remote media 
export REMOTE_PATH="$REMOTE_DIR/$BORG_FOLDER_NAME";
```
### Usage

Plug in external drive and execute `./to_external_hdd.sh`

## Backing up to internal folder

Execute `./to_internal_folder.sh`
to put data into a folder specified in `BORG_DESKTOP` variable in the config.

This step is important to backup later to the cloud. 

Variables that must be set for this step are:
```shell
# pass phrase for borg backup
export BORG_PASSPHRASE='Your Pass Phrase Here';
# borg folder name
export BORG_FOLDER_NAME='2018_desktop_borg';
# directory where to put Borg backup repo.
#  (Keep in mind, it might require a lot of space, as a rule of thumb, 1/3 of entire backup amount should be enough)
export BORG_DESKTOP="/home/mik/vm/$BORG_FOLDER_NAME";
export BORG_EXCLUDEFILE="_ignore";
```

## Backing up to the cloud 

You must install  endpoits with `rclone config` prior to this
step. Check https://rclone.org/ for documentation

Execute either of `to_cloud_backblaze.sh` or `to_cloud_wasabi.sh`
You will need additionally to set:

```shell
export BACKBLAZE_PATH="backblaze:mik-desktop-borg-bucket-for-backup"
export WASABI_PATH="wasabi:dekstop_borg"
```

And you will need already functioning backup to the **internal folder**
that **RClone** will sync to the preferable cloud

In practice, both of these commands should be executed consequently. 
I.e:

```bash
to_internal_folder.sh && to_cloud_backblaze.sh
```

## Caveats

In case you are planning to backup the entire drive, you will need to do everything 
by the **root** user, including setting up *RClone* endpoints, and *Borg repository*

## License 
The MIT license

