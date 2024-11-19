{ config, lib, pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
  "nvidia-x11"
  "nvidia-settings"
  "nvidia-persistenced"
   ];
  };
  hardware.opengl.enable = true;
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
}
