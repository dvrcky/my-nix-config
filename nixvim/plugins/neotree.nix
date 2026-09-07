{
  programs.nixvim.plugins.neo-tree.enable = true;
  programs.nixvim.plugins.neo-tree.settings = {
    filesystem.follow_current_file.enabled = true;
    close_if_last_window = true;
    window.width = 25;
  };
}
