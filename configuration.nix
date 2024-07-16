# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /home/stanley/nixos/hardware.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "prod-nix-01"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.stanley = {
    isNormalUser = true;
    description = "Stanley";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
  };

users.users.stanley.openssh.authorizedKeys.keys = [
  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPC6PrQT7ULeTRj+4WPabG4tFeRoS8Po9KeThRyjTjnP prod-code02"
  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMNcIBLH4sFk4uKmgzfYc0kZSU2nRKkazeJh2rvlDoVe prod-storage01"
  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHSLCbslrptciBVTmU8iaBDldsZ7QCPdtmAIiFNO+rqb Stanley-PC-Putty"
  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII3FiqbWCc8wOpHi4Zz3l1DtbYcOsi2O/3Jjqouf9U2T stanley-PC-WSL"
  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBXqJaNm9Qbk9Y76a7+UN9AV4MxasmXc2w+QgOkbCt1b stanley-laptop"
  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOzPjpdAVf3VYapk9YY0rGbKuGkEVQYI8S6OG6yQD0ou Stanley-Laptop-WSL"
];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    bash
    jellyfin
    radarr
    sonarr
    plex
    docker
    docker-compose
  ];  
  # List services that you want to enable:
  services.openssh.enable = true;
  # services.flatpak.enable = true;
  services.radarr.enable = true;
  services.sonarr.enable = true;
  services.plex.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };



  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 80 443 22 7878 8989 32400 8096];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Optimization settings and garbage collection automation
  nix = {
    # settings = {
    #   auto-optimise-store = true;
    #   experimental-features = [
    #     "nix-command"
    #     "flakes"
    #   ];
    #   substituters = [ "https://hyprland.cachix.org" ];
    #   trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    # };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };

  # # Auto system update
  # system.autoUpgrade = {
  #       enable = true;
  # };

  system.stateVersion = "24.05"; # Did you read the comment?

}