# PLEASE READ THE WIKI FOR DETERMINING
# WHAT TO PUT HERE AS OPTIONS. 
# https://gitlab.com/Zaney/zaneyos/-/wikis/Setting-Options

let
  # THINGS YOU NEED TO CHANGE
  username = "gamer0308";
  hostname = "nixos";
  userHome = "/home/${username}";
  flakeDir = "${userHome}/flakes";
  waybarStyle = "slickbar-num"; # simplebar, slickbar, slickbar-num, or default
in {
  # User Variables
  username = "${username}";
  hostname = "${hostname}";
  gitUsername = "Stanley Renfrew";
  gitEmail = "github@silentijsje.com";
  theme = "catppuccin-mocha";
  slickbar = if waybarStyle == "slickbar" then true else false;
  slickbar-num = if waybarStyle == "slickbar-num" then true else false;
  simplebar = if waybarStyle == "simplebar" then true else false;
  borderAnim = true;
  browser = "firefox";
  wallpaperGit = "https://gitlab.com/Zaney/my-wallpapers.git"; # This will give you my wallpapers
  # ^ (use as is or replace with your own repo - removing will break the wallsetter script) 
  wallpaperDir = "${userHome}/Pictures/Wallpapers";
  screenshotDir = "${userHome}/Pictures/Screenshots";
  flakeDir = "${flakeDir}";
  flakePrev = "${userHome}/.zaneyos-previous";
  flakeBackup = "${userHome}/.zaneyos-backup";

  # Enable / Setup NFS
  nfs = false;
  nfsMountPoint = "/mnt/nas";
  nfsDevice = "nas:/volume1/nas";

}
