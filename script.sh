#!/bin/bash

# Ścieżka do folderu z plikami
DIR="/volume1/homes/admin/PlexMediaServer/Backup"

# Przechodzimy do katalogu
cd "$DIR" || exit

# Pobieramy listę plików i sortujemy je
FILES=$(ls com.plexapp.plugins.library*.db-* | sort)

# Przechowujemy poprzedni plik
PREVIOUS_FILE=""

for CURRENT_FILE in $FILES; do
  if [[ -n $PREVIOUS_FILE ]]; then
    # Sprawdzamy, czy data poprzedniego pliku jest starsza niż obecnego
    PREVIOUS_DATE=$(echo "$PREVIOUS_FILE" | grep -oP '\d{4}-\d{2}-\d{2}')
    CURRENT_DATE=$(echo "$CURRENT_FILE" | grep -oP '\d{4}-\d{2}-\d{2}')
    
    if [[ "$CURRENT_DATE" > "$PREVIOUS_DATE" ]]; then
      # Usuwamy poprzedni plik, ponieważ jest starszy
      echo "Usuwanie $PREVIOUS_FILE"
      rm "$PREVIOUS_FILE"
    fi
  fi
  PREVIOUS_FILE="$CURRENT_FILE"
done
