# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "unix"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

# Enabling Pulseaudio
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;  
  # Enable OpenGL
  hardware.opengl.enable = true;
  
  # Load nvidia driver for Xorg and Wayland
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = pkg:
  builtins.elem (lib.getName pkg) [
"nvidia-x11"
"nvidia-settings"
"nvidia-persistenced" 
"steam"
"steam-original"
"steam-run"
  ];
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

# KDE Plasma 6
  #services.xserver.enable = true;
  #services.displayManager.sddm.enable = true;
  #services.desktopManager.plasma6.enable = true;

# Plasma 6 exclude Packages
  #environment.plasma6.excludePackages = with pkgs.kdePackages; [
#	plasma-browser-integration
#	konsole
#	oxygen
# ];  

# GNOME
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
};
  
environment.gnome.excludePackages = with pkgs; [
  gnome-photos
  gnome-tour
];

  # Configure keymap in X11
  services.xserver = {
  xkb.layout = "us,ru";
  #если я хочу использовать кверти мне надо просто удалить строку дворак
  xkb.options = "grp:alt_shift_toggle";
};


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zemo = {
     isNormalUser = true;
     extraGroups = [ "wheel" "libvirtd" ]; 
  #   packages = with pkgs; [
  #     firefox
  #     tree
  #   ];
  };

# install packages
  environment.systemPackages = with pkgs; [
#EDITOR
vim 
neovim

#Terminal
alacritty
kitty

#FETCH
neofetch
fastfetch
pfetch


# CLI
wget
vlc
haruna
doas
texlivePackages.clipboard
vesktop
telegram-desktop
obsidian
syncthing
zsh
p7zip
unzip
curl
flameshot
kitty-themes
obs-studio
syncthing
git
btop

# Music
alsa-oss 
pulseaudio
alsa-lib 
alsa-utils
alsa-tools
alsa-plugins
pavucontrol
rhythmbox
alsa-firmware
cava
pamixer
pulsemixer
mpd
ncmpcpp

# Browser
firefox
floorp
chromium
brave

#home-manager
protonup-ng
mangohud
#steam
lutris
#heroic
gnumake
gccgo
dconf
bottles
zoxide
feh
pywal
picom

#NodeJS
nodePackages.npm
nodejs_22

# Disk
parted
gparted
hdparm
e2fsprogs
sysstat
diskscan
smartmontools

#XORG
xorg.xorgserver
xorg.xf86inputevdev
xorg.xf86inputsynaptics
xorg.xf86inputlibinput
xorg.xf86videointel
xorg.xf86videoati
xorg.xf86videonouveau

#GNOME TOOLS
gnome.gnome-tweaks
gnome.gnome-power-manager
gnome.gnome-color-manager
gnome.gnome-shell-extensions

#GNOME EXTENSIONS
gnomeExtensions.burn-my-windows
gnomeExtensions.dash-to-dock
gnomeExtensions.blur-my-shell
gnomeExtensions.app-icons-taskbar
gnomeExtensions.user-themes
gnomeExtensions.arcmenu
gnomeExtensions.appindicator
gnomeExtensions.vitals
gnomeExtensions.gtk4-desktop-icons-ng-ding # new
gnomeExtensions.add-to-desktop

# Virtmanager
virt-manager

# Emacs
emacs
ripgrep
coreutils
clang
fd

qbittorrent # torrent
# Wine
wineWowPackages.stable
];

# Configuration doas
  security.doas.enable = true;
  security.sudo.enable = true;
  security.doas.extraRules = [{
	users = ["zemo"];
	keepEnv = false;
	persist = true;
}];

# Configure font
  fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "Hack" "Monaspace" "NerdFontsSymbolsOnly" ]; })
	font-awesome	
	nerdfonts
	comic-relief
	jetbrains-mono
];

# flake
  nix.settings.experimental-features = ["nix-command" "flakes"];


# Configure zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

# LibVirtd
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  #services.qemuGuest.enable = true; # if need into guest


# Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
};
  programs.steam.gamescopeSession.enable = true;
# Flatpak
services.flatpak.enable = true;


  system.stateVersion = "24.11"; # Did you read the comment?
}

