{ config, pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
  #EDITOR
  vim
  neovim

  #Terminal
  alacritty
  kitty
  tmux
  terminator

  #FETCH
  neofetch
  fastfetch
  pfetch

  # Graphic Tablet
  opentabletdriver
  config.boot.kernelPackages.digimend

  # DWM
  dmenu
# uncomment this line when install
#  (dwmblocks.override { conf = /home/zemo/suckless/dwmblocks/blocks.h; })
#  (dwm.override { conf = /home/zemo/suckless/dwm/config.h; })
#  (st.override { conf = /home/zemo/suckless/st/config.h; })
  # CLI
  scrot
  wget
  zerotierone
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
  rofi
  xclip
  xsel
  xcolor
  dunst
  ranger
  cinnamon.nemo
  nwg-look
  unclutter
  yazi
  onefetch

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
  # Library
  libcs50
  # Browser
  firefox
  floorp
  chromium
  brave
  palemoon-bin
  mullvad-browser

  libreoffice
  protonup-ng
  mangohud
  lutris
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
  xorg.libXinerama
  xorg.libX11.dev
  xorg.xev
  xorg.xmodmap
  xorg.libXft
  xorg.libXi
  #GNOME TOOLS(If i want to use gnome, need uncomment)
  gnome.gnome-tweaks
  gnome.gnome-power-manager
  gnome.gnome-color-manager
  gnome.gnome-shell-extensions
  #GNOME EXTENSIONS(If i want to use gnome, need uncomment)
  gnomeExtensions.burn-my-windows
  gnomeExtensions.dash-to-dock
  gnomeExtensions.blur-my-shell
  gnomeExtensions.app-icons-taskbar
  gnomeExtensions.user-themes
  gnomeExtensions.arcmenu
  gnomeExtensions.appindicator
  gnomeExtensions.vitals
  gnomeExtensions.gtk4-desktop-icons-ng-ding
  gnomeExtensions.add-to-desktop
  # Virtmanager
  virt-manager
  # Emacs
  emacs
  ripgrep
  coreutils
  clang
  fd

  ktorrent
  cargo
  wineWowPackages.stable
  # EDITOR
  vscodium
  zettlr

  shellcheck
  multimarkdown
  texlivePackages.markdown
  gjs
  fuse3
  git-lfs
  matugen
  gnupg
  bluez
  qdirstat
  gsmartcontrol
  eza
  lsd
  coreutils
  zip
  gzip
  bibata-cursors
  anki
  ];

  fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "Hack" "Monaspace" "NerdFontsSymbolsOnly" ]; })
	font-awesome
	nerdfonts
	comic-relief
	jetbrains-mono
  source-han-sans-japanese
  source-han-serif-japanese
  ];
}
