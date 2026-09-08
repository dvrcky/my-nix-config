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

  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      notification-window-width = 344;
      control-center-width = 380;
      control-center-margin-top = 12;
      control-center-margin-bottom = 12;
      control-center-margin-right = 12;
      timeout = 5;
      timeout-low = 5;
      timeout-critical = 5;
      transition-time = 250;
      widgets = [ "title" "dnd" "notifications" ];
    };
    style = ''
      * {
        font-family: "JetBrains Mono";
        font-size: 11pt;
      }

      .notification {
        background: #303446;
        color: #c6d0f5;
        border: 2px solid #8caaee;
        border-radius: 10px;
        margin: 6px 12px;
      }

      .notification-content {
        padding: 14px;
      }

      .summary, .body, .time {
        color: #c6d0f5;
      }

      .control-center {
        background: #303446;
        color: #c6d0f5;
        border: 2px solid #8caaee;
        border-radius: 10px;
      }

      progressbar trough {
        background: #414559;
        border-radius: 6px;
      }

      progressbar progress {
        background: #8caaee;
        border-radius: 6px;
      }
    '';
  };
}
