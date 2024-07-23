{
  programs.nixvim.plugins.mini = {
    enable = true;

    modules = {
      align = {};
      clue = {};
      cursorword = {};
      doc = {};
      extra = {};
      indentscope = {};
      trailspace = {};
      misc = {};
      surround = {};
    };
  };
}
