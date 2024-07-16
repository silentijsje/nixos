Simply copy this and run it:

```
nix-shell -p git curl
sh <(curl -L https://raw.githubusercontent.com/silentijsje/nixos/main/install-os.sh)
```

# Adding flatpack repo if needed
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo