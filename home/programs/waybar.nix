{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      modules-left = [ "niri/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "pulseaudio" "network" "battery" "tray" ];
      clock.format = "{:%H:%M}";
      network.format-wifi = "{essid}";
      network.format-ethernet = "ethernet";
      network.format-disconnected = "offline";
      pulseaudio.format = "vol {volume}%";
      pulseaudio.format-muted = "muted";
      battery.format = "bat {capacity}%";
    };
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", "JetBrains Mono";
        font-size: 14px;
      }

      window#waybar {
        background-color: #1e1e2e;
        color: #cdd6f4;
        border-bottom: 1px solid #94e2d5;
      }

      #workspaces,
      #clock,
      #pulseaudio,
      #battery,
      #network,
      #tray {
        padding: 4px 10px;
        margin: 4px 3px;
        border-radius: 10px;
      }
    '';
  };
}
