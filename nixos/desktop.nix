{ pkgs, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  programs.zen-browser.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    EDITOR = "nvim";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config.niri = {
      default = [ "gnome" "gtk" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
    };
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

}
