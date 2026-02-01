#!/bin/bash
################
# INSTALLATION #
################

echo '[1/4] Cloning the viewer repo'
git clone https://github.com/autopawn/3d-ascii-viewer # The main app that makes the arch logo spin
cd ~/3d-ascii-viewer/
make

echo '[2/4] Getting the arch OBJ model'
cd ~
git clone https://github.com/mintybrackettemp-hub/arch-spin-logo
cd ~/arch-spin-logo/
cp arch-logo.obj ~

echo '[3/4] Removing unnecessary folders'
cd ..
rm -rf arch-spin-logo

echo '[4/4] Aliasing the command archspin'
alias 'archspin'='~/3d-ascii-viewer/3d-asci-viewer ~/arch-logo.obj'

echo '!! NOTICE !!'
echo 'Currently, the script has automatically aliased the commmand archspin'
echo 'to make the arch logo spin , but this is temporary, on the next session'
echo "archspin won't work anymore, to make it permenant, add this to your"
echo 'shell config , for most users it's on ~/.bashrc, for some it's ~/.zshrc, it all depends on your shell'
echo "alias 'archspin'='~/3d-ascii-viewer/3d-asci-viewer ~/arch-logo.obj'"
