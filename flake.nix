{
  description = "NixOS system configuration";

  inputs = {
    nixpkgs = { url =  "github:nixos/nixpkgs/nixos-24.11"; };

    home-manager = {
    	url = "github:nix-community/home-manager/release-24.11";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
        url = "github:nix-community/nixvim/nixos-24.11";
        inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, ...  }: {
    nixosConfigurations.dvrcky = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
	home-manager.nixosModules.home-manager
	{
		home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;
		home-manager.users.dvrcky = import ./home-manager/home.nix;
		home-manager.extraSpecialArgs = {inherit inputs;};
	}
      ];
     };
  };
}
