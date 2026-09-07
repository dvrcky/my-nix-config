{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" ];
    };
    shellGlobalAliases = {
      nv = "nvim";
      ls = "lsd";
    };
  };
}
