#!/bin/bash
# Verifica se a "área de trabalho especial" está ativa
if hyprctl monitors | grep -q "special"; then
    # Se estiver ativa, traz as janelas normais de volta
    hyprctl dispatch togglespecialworkspace desktop
else
    # Se não estiver, joga todas as janelas atuais para o fundo e mostra a mesa
    hyprctl dispatch togglespecialworkspace desktop
fi
