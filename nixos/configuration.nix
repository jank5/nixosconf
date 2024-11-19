{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./modules/openssh.nix
      ./modules/steam.nix
      ./modules/nvidia.nix
      ./modules/flatpak.nix
      ./modules/stylix.nix
      ./modules/doas.nix
    ];

 # boot.loader.systemd-boot.enable = true;
 # boot.loader.efi.canTouchEfiVariables = true;

  # GRUB
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      useOSProber = false;
      device = "nodev";
      efiSupport = true;
    };
  };

# Hostname
  networking.hostName = "unix"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  # Set your time zone.
  time.timeZone = "Europe/Moscow";
# Enabling Pulseaudio
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;

  services.xserver = {
    enable = true;
#    displayManager = {
#      gdm.enable = true;
#      lightdm.enable = true;
#      startx.enable = true;
#    };
    windowManager.dwm.enable = true;
};
  services.xserver.digimend.enable = true;
  # KDE PLASMA 6
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

# DWM
  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: { src = /home/zemo/dwm ;});
    })
  ];

  # Exclude PKGS PLASMA 6
environment.plasma6.excludePackages = with pkgs.kdePackages; [
  plasma-browser-integration
  konsole
  elisa
];

  # Exclude PKGS Gnome
environment.gnome.excludePackages = with pkgs; [
  gnome-photos
  gnome-tour
];

  # Configure keymap in X11
  services.xserver = {
  xkb.layout = "us,ru";
  xkb.options = "grp:alt_shift_toggle";
};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zemo = {
     isNormalUser = true;
     extraGroups = [ "wheel" "libvirtd" ];
  };

# Flake
  nix.settings.experimental-features = ["nix-command" "flakes"];

# Configure zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

# LibVirtd
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  #services.qemuGuest.enable = true; # if need into guest

  system.stateVersion = "24.05";
}
