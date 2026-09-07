{ pkgs, ... }:

{
  users.users.dvrcky = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "sudo" "input" ];
  };

  programs.zsh.enable = true;
  programs.zsh.ohMyZsh.enable = true;
}
