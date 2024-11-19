{ config, pkgs, ... }:{
  # Flatpak
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-kde];
  };
}
