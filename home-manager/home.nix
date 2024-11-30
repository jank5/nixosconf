{ config, pkgs, ... }:

{
  imports = [
	  ./modules/bundle.nix
  ];
  home.username = "zemo";
  home.enableNixpkgsReleaseCheck = false;
  home.homeDirectory = "/home/zemo";
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
cmake
libtool
];
  home.file = { };
  home.sessionVariables = { };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

