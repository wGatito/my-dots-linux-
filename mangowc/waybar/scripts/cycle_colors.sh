!/bin/bash
waybar_css="$HOME/.config/waybar/style.css"
color_dir="$HOME/.config/waybar/colors"
colors=("adapta" "arc" "black" "catppuccin" "cyberpunk" "dracula" "everforest" "everforest-light" "gruvbox" ">
current_color=$(grep "@import \"colors/" "$waybar_css" | head -n 1 | cut -d'/' -f2 | cut -d'.' -f1)
if [[ -z "$current_color" ]]; then
    next_color="${colors[0]}"
else
    next_index=0
    for i in "${!colors[@]}"; do
       if [[ "${colors[$i]}" == "$current_color" ]]; then
           next_index=$(( (i + 1) % ${#colors[@]} ))
           break
       fi
    done
    next_color="${colors[$next_index]}"
fi
sed -i "s|@import \"colors/.*\.css\";|@import \"colors/${next_color}.css\";|" "$waybar_css"
notify-send "Waybar Theme" "Switched to ${next_color}"
