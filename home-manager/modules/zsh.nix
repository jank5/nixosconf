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
      	rb = "doas nixos-rebuild switch --flake ${flakeDir}";
      	upd = "nix flake update ${flakeDir}";
      	upg = "doas nixos-rebuild switch --upgrade --flake ${flakeDir}";
      	hms = "home-manager switch --flake ${flakeDir}";

      	conf = "nvim ${flakeDir}/nixos/configuration.nix";

      	grep = "grep --color=auto";
      	c = "clear";
      	ls = "exa";
      	l = "exa -l";
      	la = "exa -la";
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
