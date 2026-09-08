{ pkgs, ... }:
{
  home.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      reload_style_on_change = true;
      margin-top = 1;
      margin-left = 10;
      margin-right = 10;
      margin-bottom = 2;
      height = 10;

      modules-left = [ "group/left1" "group/left2" "group/left3" ];
      modules-center = [ "niri/workspaces" ];
      modules-right = [
        "group/tray-expander"
        "backlight"
        "bluetooth"
        "pulseaudio#output"
        "pulseaudio#input"
        "network"
        "memory"
        "cpu"
        "battery"
      ];

      "group/left1" = {
        orientation = "inherit";
        modules = [ "custom/launcher" "clock" "idle_inhibitor" ];
      };
      "group/left2" = {
        orientation = "inherit";
        modules = [ "niri/window" ];
      };
      "group/left3" = {
        orientation = "inherit";
        modules = [ "mpris" ];
      };
      "custom/launcher" = {
        format = "";
        on-click = "${pkgs.rofi}/bin/rofi -show drun";
        on-click-right = "${pkgs.kitty}/bin/kitty";
        tooltip-format = "Applications";
      };
      "niri/workspaces".format = "{index}";
      "niri/window" = {
        format = "{title}";
        max-length = 55;
      };
      clock = {
        format = "{:%H:%M}";
        format-alt = "{:%A, %d %B %Y - %H:%M}";
        tooltip-format = "<span>{calendar}</span>";
        calendar = {
          mode = "month";
          weeks-pos = "right";
          format = {
            months = "<span color='#ffead3'><b>{}</b></span>";
            weekdays = "<span color='#ffcc66'><b>{}</b></span>";
            today = "<span color='#ff6699'><b>{}</b></span>";
          };
        };
      };
      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          activated = "󰛊";
          deactivated = "󰾫";
        };
      };
      "group/tray-expander" = {
        orientation = "inherit";
        drawer = {
          transition-duration = 600;
          children-class = "tray-group-item";
        };
        modules = [ "custom/expand-icon" "tray" ];
      };
      "custom/expand-icon" = {
        format = "  ";
        tooltip = false;
      };
      tray = {
        icon-size = 12;
        spacing = 12;
      };
      backlight = {
        format = "{icon}";
        tooltip-format = "{percent}%";
        format-icons = [ "󰃞" "󰃟" "󰃝" "󰃠" ];
        on-scroll-up = "${pkgs.brightnessctl}/bin/brightnessctl set +5%";
        on-scroll-down = "${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
      };
      bluetooth = {
        format = "󰂯";
        format-disabled = "󰂲";
        format-off = "󰂲";
        format-connected = "󰂱";
        tooltip-format = "Devices connected: {num_connections}";
        on-click = "${pkgs.blueman}/bin/blueman-manager";
      };
      "pulseaudio#output" = {
        format = "{icon} {volume}%";
        format-muted = " off";
        format-icons.default = [ "" ];
        tooltip-format = "{icon} {volume}%";
        max-volume = 100;
        scroll-step = 2;
        smooth-scrolling-threshold = 1;
        on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        on-click-right = "${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
      };
      "pulseaudio#input" = {
        format = "{format_source}";
        format-source = "";
        format-source-muted = "";
        tooltip-format = "{format_source} {source_volume}%";
        on-click = "${pkgs.pavucontrol}/bin/pavucontrol --tab=4";
        on-click-right = "${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        on-scroll-up = "${pkgs.pulseaudio}/bin/pactl set-source-volume @DEFAULT_SOURCE@ +1%";
        on-scroll-down = "${pkgs.pulseaudio}/bin/pactl set-source-volume @DEFAULT_SOURCE@ -1%";
      };
      network = {
        format = "{icon}";
        format-wifi = "{icon}";
        format-ethernet = "󰈀";
        format-disconnected = "󰤮";
        format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
        tooltip-format-wifi = "{essid} ({frequency} GHz)\nDown: {bandwidthDownBytes}  Up: {bandwidthUpBytes}";
        tooltip-format-ethernet = "Down: {bandwidthDownBytes}  Up: {bandwidthUpBytes}";
        tooltip-format-disconnected = "Disconnected";
        interval = 3;
        on-click = "${pkgs.kitty}/bin/kitty ${pkgs.networkmanager}/bin/nmtui";
      };
      memory = {
        interval = 2;
        format = " {percentage}%";
        on-click = "${pkgs.kitty}/bin/kitty ${pkgs.btop}/bin/btop";
      };
      cpu = {
        interval = 2;
        format = " {usage}%";
        on-click = "${pkgs.kitty}/bin/kitty ${pkgs.btop}/bin/btop";
      };
      battery = {
        format = "{capacity}% {icon}";
        format-charging = "{capacity}% {icon}";
        format-plugged = " {capacity}%";
        format-full = "󰂅 {capacity}%";
        format-icons = {
          charging = [ "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
          default = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };
        tooltip-format-discharging = "{timeTo}";
        tooltip-format-charging = "{timeTo}";
        interval = 5;
        states = {
          warning = 20;
          critical = 10;
        };
      };
      mpris = {
        format = "{player_icon} {artist}-{title}";
        format-paused = "<span color='grey'>{status_icon} {dynamic}</span>";
        max-length = 50;
        interval = 1;
        player-icons.default = "";
        player-icons.mpv = "";
        status-icons.paused = "";
        ignored-players = [ "firefox" "chromium" "brave" ];
      };
    };
    style = ''
      /* V2.4 by HANCORE-linux, adapted for Niri without Omarchy theme imports. */
      @define-color background #1e1e2e;
      @define-color foreground #cdd6f4;

      * {
        font-family: "JetBrainsMono Nerd Font", "JetBrains Mono";
        font-size: 10px;
        font-weight: bold;
        min-height: 0;
      }

      window#waybar {
        background-color: transparent;
        color: @foreground;
      }

      window#waybar > box {
        background-color: alpha(@background, 0.75);
        box-shadow: 0 0 0 1px alpha(@foreground, 0.15),
                    0 8px 20px alpha(#000000, 0.25);
        border-radius: 24px;
        padding: 1px;
      }

      window#waybar.empty #window {
        background: transparent;
        border: none;
        color: transparent;
        padding: 0;
        margin: 0;
      }

      window#waybar.empty #left2 {
        opacity: 0;
      }

      #left1,
      #left2,
      .modules-right,
      #mpris {
        border-radius: 24px;
        border: 0.5px solid alpha(@foreground, 0.8);
        color: @foreground;
        background-color: alpha(@background, 0.9);
      }

      #left1,
      #left2 {
        margin-right: 2px;
      }

      .modules-right {
        padding-right: 4px;
      }

      #workspaces {
        border: 0.5px solid alpha(@foreground, 0.8);
        border-radius: 24px;
        background-color: @background;
        opacity: 0.95;
        padding: 1px;
      }

      #workspaces button {
        padding: 0 1px;
        margin: 1px;
        border-radius: 24px;
        background-color: alpha(@foreground, 0.5);
        color: @background;
        transition: all 0.15s ease-in-out;
        opacity: 0.95;
      }

      #workspaces button.empty {
        background-color: alpha(@foreground, 0.4);
        color: @foreground;
        opacity: 0.45;
      }

      #workspaces button.active {
        padding: 0 15px;
        background-color: alpha(@foreground, 0.9);
        color: @background;
        opacity: 1;
      }

      #workspaces button:hover {
        background-color: @foreground;
        color: @background;
        opacity: 1;
      }

      #tray,
      #window,
      #tray-expander,
      #mpris,
      #cpu,
      #clock,
      #pulseaudio,
      #battery,
      #network,
      #memory,
      #backlight,
      #bluetooth,
      #custom-launcher,
      #idle_inhibitor {
        min-width: 16px;
        margin: 0 2px;
        padding: 0 3px;
      }

      #memory,
      #cpu {
        min-width: 30px;
      }

      #backlight {
        padding-top: 1px;
      }

      #tray {
        background-color: transparent;
        border-radius: 24px;
        margin: 0 10px;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: transparent;
      }

      tooltip {
        padding: 4px;
        background: @background;
        border: 1px solid alpha(@foreground, 0.8);
        border-radius: 8px;
        box-shadow: 1px 1px 3px 1px #131313;
        font-size: 12px;
      }

      tooltip label {
        color: @foreground;
        font-weight: normal;
      }

      #mpris {
        padding: 0 10px;
        margin: 0;
        animation: blink 3s linear infinite alternate;
      }

      @keyframes blink {
        to { color: #4a4a4a; }
      }

      #battery.warning {
        color: #c95d0f;
        background-color: alpha(@background, 0.9);
      }

      #battery.critical:not(.charging) {
        color: #e6d8ba;
        animation: blink-battery 0.5s steps(12) infinite alternate;
      }

      @keyframes blink-battery {
        to { color: #f53c3c; }
      }
    '';
  };
}
