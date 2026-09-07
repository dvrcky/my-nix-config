{
  description = "Clean modular NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:LunaCOLON3/zen-browser-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = inputs@{ nixpkgs, home-manager, niri, zen-browser, nixvim, ... }: {
    nixosConfigurations.dvrcky = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        {
          nixpkgs.overlays = [
            niri.overlays.niri
            (final: prev: {
              pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
                (python-final: python-prev: {
                  picosvg = python-prev.picosvg.overridePythonAttrs (_: {
                    doCheck = false;
                  });
                })
              ];
            })
          ];
        }

        niri.nixosModules.niri
        zen-browser.nixosModules.zen-browser
        nixvim.nixosModules.nixvim
        ./nixos

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.dvrcky = import ./home;
        }
      ];
    };
  };
}
