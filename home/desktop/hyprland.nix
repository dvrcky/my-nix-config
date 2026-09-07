{ config, pkgs, ... }:

let
  hyprlockConfig = "${config.xdg.configHome}/hypr/hyprlock.conf";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        "eDP-1,1920x1080@144,0x0,1"
        "HDMI-A-1,1920x1080@100,1920x0,1,transform,1"
      ];

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        touchpad.natural_scroll = false;
      };

      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 1;
        layout = "dwindle";
      };

      decoration = {
        rounding = 0;
        blur = {
          enabled = true;
          size = 14;
          passes = 4;
        };
      };

      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, Return, exec, kitty"
        "$mainMod, C, killactive"
        "$mainMod, R, exec, rofi -show run"
        "$mainMod, Q, exec, hyprlock -c ${hyprlockConfig}"
        "$mainMod, F, fullscreen"
      ];
      binde = [
        ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        ", XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      exec-once = [
        "hyprpaper"
        "hypridle"
        "waybar"
      ];
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        grace = 0;
        disable_loading_bar = false;
      };
      background = [
        {
          monitor = "eDP-1";
          path = "$HOME/Downloads/back.jpg";
          blur_passes = 1;
          blur_size = 2;
        }
      ];
      input-field = [
        {
          monitor = "eDP-1";
          size = "230, 38";
          position = "0, -215";
          halign = "center";
          valign = "center";
          placeholder_text = "<i><span foreground=\"##ffffff99\">Enter Pass</span></i>";
        }
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock -c ${hyprlockConfig}";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 300;
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 400;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 430;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "$HOME/Downloads/wall.jpg" ];
      wallpaper = [ "eDP-1,$HOME/Downloads/wall.jpg" ];
    };
  };

  home.packages = with pkgs; [
    hyprshot
  ];
}
