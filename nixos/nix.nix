{ pkgs, ... }:

{
  nix = {
    package = pkgs.nixVersions.stable;
    settings = {
      auto-optimise-store = true;
      download-buffer-size = 524288000;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
  };
}
