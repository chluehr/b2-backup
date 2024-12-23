#!/bin/bash

#
# Rationale: 
# - Simple Backup, simple restore
# - Suitable for *small* backups
# - No special backup format, just plain file sync
# - Full backup each time
# - Encryption: Via B2 (no internal encryption)
# - Purging: Via B2 (e.g. 14 days to hide, 14 days from hide to delete)
#
# Set the following environment variables:
# - BACKUPS=<NAME1>:<PATH1>[,<NAME2>:<PATH2>]
# - B2_BUCKET=
# - B2_APPLICATION_KEY_ID=
# - B2_APPLICATION_KEY=

export PATH=$PATH:/root/.local/bin

export BACKUP_DATE=`date '+%Y-%m-%d'`

echo -n "BACKUP START: "
date

b2v4 account authorize 2>&1 >/dev/null

IFS=','

for item in $BACKUPS; do
  IFS=':' read -r BACKUP_NAME BACKUP_PATH <<< "$item"
  echo "Backup: $BACKUP_NAME [$BACKUP_PATH] - $BACKUP_DATE"
  b2v4 sync $BACKUP_PATH "b2://$B2_BUCKET/$BACKUP_NAME/$BACKUP_DATE"
done

echo -n "BACKUP END: "
date

# EOF

