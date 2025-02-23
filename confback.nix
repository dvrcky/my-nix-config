# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, config, lib, pkgs, ... }:

{
  # autologin
  services.getty.autologinUser = "dvrcky";

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.nixvim.nixosModules.nixvim
      ./nixvim/nixvim.nix
    ];

  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

  };

  environment.variables.XCURSOR_SIZE = "24";

  nix.settings.auto-optimise-store = true;
  # Turn on bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Hyprland
  programs.hyprland = {
    enable = true;
  };

  # Unfree programs


  # Set zsh as default shell
  users.users.dvrcky.shell = pkgs.zsh;
  programs.zsh.ohMyZsh.enable = true;
  programs.zsh.enable = true;
  # Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "dvrcky"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.


  # Set your time zone.
  time.timeZone = "Europe/Saratov";
  nixpkgs.config.permittedInsecurePackages = [
    "electron-27.3.11"
  ];
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };


  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  services.printing.enable = true;
  hardware.pulseaudio.enable = false;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dvrcky = {
    isNormalUser = true;
    extraGroups = [ "wheel" "sudo" "dvrcky" "input"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "nvidia-persistenced"
    ];

  # Videocard
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  # Automatizatoin of deleting garbage
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older_than 7d";
  # Automatizatoin of deleting garbage
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    clang-manpages
    man-pages
    man-pages-posix

    qemu
    quickemu
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    hyprland
    polkit
    xdg-desktop-portal-hyprland
    xwayland
    kitty
    bluez
    git
    pulseaudio
    gnumake
    libpulseaudio
    zsh
    xclip
    valgrind
    ctags
    wayland-protocols
    mesa
  ];

  # Some fonts
  fonts.packages = with pkgs; [
    nerdfonts
    jetbrains-mono
    font-awesome
  ];

  # Default applications
  xdg.mime.defaultApplications = {
  "text/html" = "firefox";
  "x-scheme-handler/http" = "firefox";
  "x-scheme-handler/https" = "firefox";
  "x-scheme-handler/about" = "firefox";
  "x-scheme-handler/unknown" = "firefox";
  };

  environment.variables.EDITOR = "nvim";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}

