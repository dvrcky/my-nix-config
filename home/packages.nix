{ pkgs, ... }:

{
  home.packages = with pkgs; [
    awww
    brightnessctl
    clang
    cmake
    curl
    dconf
    discord
    feh
    gdb
    gf
    gnumake
    htop
    libreoffice
    lsd
    obsidian
    qbittorrent
    ranger
    rustc
    rustup
    unzip
    wget
    zathura
  ];
}
