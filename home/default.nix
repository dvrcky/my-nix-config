{ ... }:

{
  imports = [
    ./cursor.nix
    ./git.nix
    ./packages.nix
    ./programs/kitty.nix
    ./programs/rofi.nix
    ./programs/tmux.nix
    ./programs/waybar.nix
    ./programs/zathura.nix
    ./programs/zsh.nix
  ];

  home = {
    username = "dvrcky";
    homeDirectory = "/home/dvrcky";
    stateVersion = "26.05";
    sessionPath = [ "$HOME/.cargo/bin" ];
  };

  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000;
      ignore-timeout = false;
      "urgency=critical" = {
        default-timeout = 5000;
      };
    };
  };
}
