{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "cloud";
      plugins = [ "git" ];
    };
    shellGlobalAliases = {
      nv = "nvim";
      ls = "lsd";
      rebuild = "sudo nixos-rebuild switch --flake /home/dvrcky/.config/nix/my-nix-config#dvrcky";
    };
  };
}
