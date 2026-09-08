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
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
    config.common.default = "wlr";
    config.niri = {
      default = "wlr";
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

}
