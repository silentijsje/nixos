#!/bin/sh

#https://github.com/charles37/flake2/blob/main/install-zaneyos.sh

if [ -n "$(cat /etc/os-release | grep -i nixos)" ]; then
    echo "This is NixOS."
    echo "Continuing with the ZaneyOS installation."
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
    exit 1
fi

echo "-----"

cd ~/nixos
echo "Cloning & Entering Repository"
git reset --hard
git pull https://github.com/silentijsje/nixos.git
chmod +x ~/nixos/install-os.sh

# echo "-----"

# echo "Generating The Hardware Configuration"
# nixos-generate-config --show-hardware-config > hardware.nix

echo "-----"

pushd ~/nixos
echo "Now Going To Build Nixos, 🤞"
sudo nixos-rebuild switch -I nixos-config=configuration.nix