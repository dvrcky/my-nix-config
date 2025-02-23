{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g @plugin 'christoomey/vim-tmux-navigator'
      set -g @plugin 'tmux-plugins/tmp'
      set -g @plugin 'tmux-plugins/tmux-sensible'

      run '~/.tmux/plugins/tpm/tpm'
    '';
  };
}
