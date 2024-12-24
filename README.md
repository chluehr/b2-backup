# b2-backup

## Purpose

Use supercronic and Backblaze cli b2 sync for simple daily backups.

## Usage

Say, you have two sets of files you want to backup.
Mount each one somewhere into the the image.
Provide the BACKUPS environment variable with comma separated pairs
of BACKUP_NAME and BACKUP_PATH separated with ':'.

Docker compose:
```
version: '3'
services:
  b2-backup:
    image: chluehr/b2-backup:latest
    environment:
      - B2_BUCKET=my-bucket-name
      - B2_APPLICATION_KEY_ID=my-key-id
      - B2_APPLICATION_KEY=my-key
      - BACKUPS=data1:/bak/data1,data2:/bak/data2
      - EXCLUDE_REGEX='(.*\.DS_Store)|(.*\.Spotlight-V100)'
      - TZ=Europe/Berlin
    restart: always
    volumes:
      - ./data1:/bak/data1
      - ./data2:/bak/data2
```

Within the bucket, the directory structure is build up like ```BUCKET/BACKUP_NAME/YYYY-MM-DD```.

## Links

* Github: https://github.com/chluehr/b2-backup
* Docker Hub: https://hub.docker.com/repository/docker/chluehr/b2-backup/general

