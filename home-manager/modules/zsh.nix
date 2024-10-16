{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # enableAutosuggestions = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;


    initExtra = ''
    export EDITOR=nvim
    eval "$(ssh-agent -s)"
    clear && pfetch
    '';

    shellAliases =
      let
        flakeDir = "/home/zemo/nixosconf/";
      in {
      	rb = "doas nixos-rebuild switch --flake ${flakeDir}";
      	upd = "nix flake update ${flakeDir}";
      	upg = "doas nixos-rebuild switch --upgrade --flake ${flakeDir}";
      	hms = "home-manager switch --flake ${flakeDir}";

      	conf = "nvim ${flakeDir}/nixos/configuration.nix";

      	grep = "grep --color=auto";
      	c = "clear";
      	e = "emacs -nw";
      	v = "nvim";
      	dv = "doas nvim";
      	ff = "fastfetch";
	      ".." = "cd ..";
	      "..." = "cd ../..";
	      ".3" = "cd ../../..";
	      ".4" = "cd ../../../..";
	      ".5" = "cd ../../../../..";
        ld = "lsd";
        lf = "lsd -F";
        ls = "eza -al --color=always --group-directories-first"; # my preferred listing
        la = "eza -a --color=always --group-directories-first";  # all files and dirs
        ll = "eza -l --color=always --group-directories-first"; # long format
        lt = "eza -aT --color=always --group-directories-first"; # tree listing
        "l." = "eza -al --color=always --group-directories-first ../"; # ls on the PARENT directory
        "l.." = "eza -al --color=always --group-directories-first ../../"; # ls on directory 2 levels up
        "l..." = "eza -al --color=always --group-directories-first ../../../"; # ls on directory 3 levels
        df = "df -h";               # human-readable sizes
        free = "free -m";           # show sizes in MB
        killdwm = "pkill -KILL -u $USER";
        chqwe = "setxkbmap -model pc105 -layout us,ru -variant qwerty -option grp:alt_shift_toggle";
        chdvk = "setxkbmap -model pc105 -layout us,ru -variant dvorak -option grp:alt_shift_toggl";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "copyfile" ];
      theme = "gianu";
     # theme = "random"; 
    };
  };
}
