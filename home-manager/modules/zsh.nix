{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # enableAutosuggestions = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "~/nix";
      in {
      	rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
      	upd = "nix flake update ${flakeDir}";
      	upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

      	hms = "home-manager switch --flake ${flakeDir}";

      	conf = "nvim ${flakeDir}/nixos/configuration.nix";
      	pkgs = "nvim ${flakeDir}/nixos/packages.nix";

	c = "clear";
      	ll = "ls -l";
      	v = "nvim";
      	dv = "doas nvim";
      	ff = "fastfetch";
	".." = "cd ..";
	"..." = "cd ../..";
	".3" = "cd ../../..";
	".4" = "cd ../../../..";
	".5" = "cd ../../../../..";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "copyfile" ];
      theme = "gianu";
     # theme = "random"; 
    };
  };
}
