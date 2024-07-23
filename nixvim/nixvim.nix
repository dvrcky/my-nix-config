{

	imports = [
		./plugins/plugins.nix
		./keymaps.nix
	];
	programs.nixvim = {
		enable = true;
                opts = {
                  relativenumber = true;
                  tabstop = 2;
                  shiftwidth=2;
                };
		colorschemes.nightfox.enable = true;
		defaultEditor = true;
	};
}
