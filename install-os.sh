#!/bin/sh

#https://github.com/charles37/flake2/blob/main/install-zaneyos.sh

if [ -n "$(cat /etc/os-release | grep -i nixos)" ]; then
    echo "Verified this is NixOS."
    echo "-----"
else
    echo "This is not NixOS or the distribution information is not available."
    exit
fi

if command -v git &> /dev/null; then
    echo "Git is installed, continuing with installation."
else
    echo "Git is not installed. Please install Git and try again."
    echo "Example: nix-shell -p git"
    exit
fi

echo "-----"

echo "Ensure In Home Directory"
cd

echo "-----"

echo "Cloning & Entering Repository"
git clone https://github.com/silentijsje/nixos.git
cd nixos

echo "-----"

echo "Generating The Hardware Configuration"
nixos-generate-config --show-hardware-config > hardware.nix

echo "-----"

echo "Now Going To Build Nixos, 🤞"
sudo nixos-rebuild switch -I nixos-config=configuration.nix