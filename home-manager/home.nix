{ config, pkgs, ... }:

{
  imports = [
	./modules/bundle.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "zemo";
  home.homeDirectory = "/home/zemo";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
	marked-man
	shellcheck
	multimarkdown
	texlivePackages.markdown
	gjs
	matugen
# Disk check utils
	qdirstat
	gsmartcontrol
# Alternative ls
	eza
	lsd
# Emacs packages
emacs
ripgrep
fd
clang
coreutils
  ];

  home.file = {
  };

  

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}

