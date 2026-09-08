{

	imports = [
		./plugins/plugins.nix
		./keymaps.nix
	];
	programs.nixvim = {
		enable = true;
                opts = {
                  relativenumber = true;
                  tabstop = 4;
                  shiftwidth=4;
                  laststatus = 3;
                };
		colorschemes.catppuccin.enable = true;
		defaultEditor = true;
	};
}
