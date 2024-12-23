# b2-backup

## Purpose

Use supercronic and Backblaze cli b2 sync for simple daily backups.

## Usage

Say, you have two sets of files you want to backup.
Mount each one somewhere into the the image.
Provide the BACKUPS environment variable with backup names and paths within the container.

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
      - BACKUPS=data1:/data1,data2:/data2
      - TZ=Europe/Berlin
    restart: always
    volumes:
      - ./data1:/data1
      - ./data2:/data2
```


