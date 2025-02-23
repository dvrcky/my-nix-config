{ config, pkgs, lib, inputs, ... }: {
  home = {
    username = "dvrcky";
    homeDirectory = "/home/dvrcky";
    stateVersion = "24.11";

    packages = with pkgs; [
    # programming stuff
    rustc
    cargo
    clang

    # just my stuff
    ponysay
    qbittorrent
    byedpi

    freerdp
    syncthing
    logseq
    (discord.override {
        withVencord = true;
      })

    # fot pictures
    feh
    imagemagick

    # stuff for hypr
     feh
     openvpn

    # utils
     lsd
     zathura
     brightnessctl
     libreoffice
     dconf
     neofetch
     htop
     curl
     wget
     ranger
     unzip
     # to communicate with society
     firefox
     python310
    ];
  };

  imports = [
    ./progs/zsh/zsh.nix
    ./progs/zathura/zathura.nix
    ./progs/hypr/hyprpaper.nix
    ./progs/git/git.nix
    ./progs/hypr/hypridle.nix
    ./progs/kitty/kitty.nix
    ./progs/hypr/hyprland.nix
    ./progs/hypr/waybar.nix
    ./progs/rofi/rofi.nix
    ./progs/tmux/tmux.nix
];

}
