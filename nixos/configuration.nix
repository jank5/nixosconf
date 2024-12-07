{ config, lib, pkgs, ... }:
{
  imports = [
      ./hardware-configuration.nix
      ./packages.nix
      ./modules/bundle.nix
    ];

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
  networking.hostName = "unix";
  networking.networkmanager.enable = true;
# Set your time zone.
  time.timeZone = "Europe/Moscow";

# Enabling Pulseaudio
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;

# XSERVER
  services.xserver = {
    enable = true;
    displayManager = {
#      gdm.enable = true;
#      lightdm.enable = true;
      startx.enable = true;
    };
    windowManager.dwm.enable = true;
};
  services.xserver.digimend.enable = true;

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

# LibVirtd(uncomment when install)
#  virtualisation.libvirtd.enable = true;
#  programs.virt-manager.enable = true;

# nix-ld(uncomment when install)
#  programs.nix-ld.enable = true;
#  programs.nix-ld.libraries = with pkgs; [
#  fuse3
#  zlib
#  bash
#  stdenv.cc.cc
#  icu
#  nss
#  openssl
#  libgtkflow3
#  gtk4
#  curl
#  expat
#  ];
  system.stateVersion = "24.11";
}
