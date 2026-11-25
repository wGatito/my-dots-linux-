if status is-interactive
    fastfetch
end

set -gx TERMINAL kitty
function fish_prompt
    echo "ׂ╰┈➤ "
    set -U fish_greeting ""
end
