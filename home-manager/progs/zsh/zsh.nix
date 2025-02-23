{
  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "agnoster";
    plugins = [
      "git"
    ];
  };
  
  programs.zsh = {
    shellGlobalAliases = {
      nv = "nvim";
      ls = "lsd";
    };
  };
}
