#!/bin/bash

STYLE="$HOME/.config/waybar/style.css"
LAYOUTS=("pill.css" "compact-pill.css" "outline.css" "square.css" "standard.css")

CURRENT=$(grep -oP 'layouts/\K[^"]+' "$STYLE")

for i in "${!LAYOUTS[@]}"; do
    if [[ "${LAYOUTS[$i]}" == "$CURRENT" ]]; then
        NEXT=${LAYOUTS[((i + 1) % ${#LAYOUTS[@]})]}
        break
    fi
done

sed -i "s|layouts/$CURRENT|layouts/$NEXT|" "$STYLE"
