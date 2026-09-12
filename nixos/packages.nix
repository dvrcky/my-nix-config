{ lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "anytype"
    "anytype-heart"
    "claude-code"
    "discord"
    "discord-unwrapped"
    "nvidia-kernel-modules"
    "nvidia-persistenced"
    "nvidia-settings"
    "nvidia-x11"
    "obsidian"
    "spotify"
    "yandex-music"
  ];

  environment.systemPackages = with pkgs; [
    amneziawg-tools
    ayugram-desktop
    bluez
    clang-manpages
    claude-code
    entr
    git
    kdePackages.polkit-kde-agent-1
    libproxy
    llama-cpp
    man-db
    man-pages
    man-pages-posix
    mattermost-desktop
    mesa
    nftables
    opencode
    qemu
    sing-box
    tree
    typst
    uv
    vim
    xauth
    xinit
    xrandr
    xwayland-satellite
    zip
    zsh-syntax-highlighting
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts._0xproto
    nerd-fonts.droid-sans-mono
  ];

  xdg.mime.defaultApplications."application/pdf" = "org.pwmt.zathura.desktop";
}
