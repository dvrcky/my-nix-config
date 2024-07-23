{ config, pkgs, lib, inputs, ... }: {
  # Unfree packages
  nixpkgs.config.permittedInsecurePackages = [
     "electron-28.3.3"
  ]; 


  programs.waybar = {
    enable = true;
  };
   
  nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "electron" # for a lot of apps
      ];


  home = {
    username = "dvrcky";
    homeDirectory = "/home/dvrcky";
    stateVersion = "24.05";

    packages = with pkgs; [
    # stuff for hypr
     hypridle
     hyprlock
     waybar
     rofi
     hyprpaper

    # utils
     lsd
     zathura
     dconf
     neofetch
     htop
     curl
     wget
     ranger
     unzip
     alacritty
     tmux

    # to communicate with society
     telegram-desktop
     firefox

    # my productivity
     logseq
     syncthing

    ];
  };

  imports = [
    ./progs/alacritty/alacritty.nix
    ./progs/zsh/zsh.nix
    ./progs/zathura/zathura.nix
    ./progs/hypr/hyprpaper.nix
    ./progs/git/git.nix 
    ./progs/kitty/kitty.nix
    ./progs/hypr/hyprland.nix
    ./progs/hypr/waybar.nix
    ./progs/rofi/rofi.nix
];

}
