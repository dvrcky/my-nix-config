{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./desktop.nix
    ./hardware.nix
    ./nix.nix
    ./packages.nix
    ./sing-box.nix
    ./users.nix
    ./nixvim.nix
  ];

  networking.hostName = "navi";
  time.timeZone = "Europe/Saratov";

  system.stateVersion = "24.11";
}
