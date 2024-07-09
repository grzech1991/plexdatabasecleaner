#!/bin/bash

# Path to plex database directory
DIR="/volume1/homes/admin/PlexMediaServer/Backup"

# Moving to the directory
cd "$DIR" || exit

# Downloading a list of files and sorting
FILES=$(ls com.plexapp.plugins.library*.db-* | sort)

PREVIOUS_FILE=""

for CURRENT_FILE in $FILES; do
  if [[ -n $PREVIOUS_FILE ]]; then
    # Checking whether the date of the previous file is older than the current one
    PREVIOUS_DATE=$(echo "$PREVIOUS_FILE" | grep -oP '\d{4}-\d{2}-\d{2}')
    CURRENT_DATE=$(echo "$CURRENT_FILE" | grep -oP '\d{4}-\d{2}-\d{2}')
    
    if [[ "$CURRENT_DATE" > "$PREVIOUS_DATE" ]]; then
      # Deleting the previous file because it is older
      echo "Deleting $PREVIOUS_FILE"
      rm "$PREVIOUS_FILE"
    fi
  fi
  PREVIOUS_FILE="$CURRENT_FILE"
done
