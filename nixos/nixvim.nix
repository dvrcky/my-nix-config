{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.catppuccin.enable = true;
    opts = {
      relativenumber = true;
      tabstop = 4;
      shiftwidth = 4;
    };

    plugins = {
      autoclose.enable = true;
      cmp.enable = true;
      fidget.enable = true;
      lsp.enable = true;
      lualine.enable = true;
      luasnip.enable = true;
      neo-tree.enable = true;
      nix.enable = true;
      tagbar.enable = true;
      toggleterm.enable = true;
      treesitter.enable = true;
      ts-autotag.enable = true;
      twilight.enable = true;
    };
  };
}
