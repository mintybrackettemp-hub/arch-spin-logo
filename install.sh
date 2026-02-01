#!/usr/bin/env bash
# =============================================
#   arch-spin-logo installer
# =============================================

set -euo pipefail   # die on errors & undefined vars — very based

echo -e "\n🚀 [1/5] Cloning 3d-ascii-viewer (the goat ascii 3d renderer) 🔥"
git clone https://github.com/autopawn/3d-ascii-viewer.git ~/3d-ascii-viewer || {
    echo "❌ git clone failed... you good bro?"
    exit 1
}

cd ~/3d-ascii-viewer

echo -e "\n🛠️ [2/5] Building it (needs ncurses & make stuff)"
# Arch moment: make sure you have the build deps
if ! pacman -Q ncurses >/dev/null 2>&1; then
    echo "→ installing ncurses and base-devel"
    sudo pacman -S --needed ncurses base-devel
fi

make || {
    echo "❌ make failed... did you forget base-devel group? 😭"
    echo "   try:   sudo pacman -S base-devel ncurses on arch btw"
    exit 1
}

echo -e "\n📂 [3/5] Looking for your arch-logo.obj"

if [[ ! -f ~/arch-spin-logo/arch-logo.obj ]]; then
    echo "⚠️  ~/arch-spin-logo/arch-logo.obj not found!"
    echo "   Did you really git clone https://github.com/mintybrackettemp-hub/arch-spin-logo/ ?"
    echo "   If not → run this first:"
    echo "      git clone https://github.com/mintybrackettemp-hub/arch-spin-logo ~/arch-spin-logo"
    echo ""
    read -p "→ Press Enter once you cloned it... or Ctrl+C to ragequit "
fi

if [[ ! -f ~/arch-spin-logo/arch-logo.obj ]]; then
    echo "❌ still can't find arch-logo.obj ... giving up fr 💀"
    exit 1
fi

cp ~/arch-spin-logo/arch-logo.obj ~/
echo "→ copied arch-logo.obj to home sweet home ~"

echo -e "\n🧹 [4/5] Cleaning up the temp repo (you don't need it anymore)"
cd ~
rm -rf arch-spin-logo
echo "   gone. very clean. much wow."

echo -e "\n⌨️  [5/5] Creating temporary archspin command"

alias archspin='~/3d-ascii-viewer/3d-ascii-viewer ~/arch-logo.obj'

echo ""
echo "🎉 Done frfr!"
echo ""
echo "   Now just type → archspin"
echo ""
echo "   To make it work forever (even after reboot):"
echo "   1. just add this line to your ~/.bashrc / ~/.zshrc / ~/.config/fish/config.fish"
echo ""
echo "      alias archspin='~/3d-ascii-viewer/3d-ascii-viewer ~/arch-logo.obj'"
echo ""
echo ""
