#!/bin/bash

# O Waypaper passa o caminho da imagem escolhida em $1
IMAGE_PATH="$1"

# --- CONFIGURAÇÃO DO HYPRLOCK ---
# Altere para o caminho exato que o seu hyprlock.conf lê (Ex: ~/.cache/current_background.jpg)
HYPRLOCK_CACHE="$HOME/.cache/current_background"

# --- CONFIGURAÇÃO DO SDDM ---
SDDM_THEME_DIR="/usr/share/sddm/themes/silent"
SDDM_BG_NAME="background.jpg"

if [ -f "$IMAGE_PATH" ]; then
    # 1. Atualiza o cache do hyprlock instantaneamente
    cp "$IMAGE_PATH" "$HYPRLOCK_CACHE"

    # 2. Atualiza o SilentSDDM (pedirá senha root na interface gráfica)
    pkexec cp "$IMAGE_PATH" "$SDDM_THEME_DIR/$SDDM_BG_NAME"
fi
