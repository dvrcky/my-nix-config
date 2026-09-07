{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = [
      pkgs.tmuxPlugins.vim-tmux-navigator
      pkgs.tmuxPlugins.sensible
    ];
  };
}
