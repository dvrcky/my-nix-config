# NixOS Configuration

The system configuration is split into small modules, with Home Manager used
for user-level programs and settings. The desktop session is based on Niri.

## Applying Changes

Check the flake without building:

```sh
nix flake check . --no-build
```

Apply the system configuration:

```sh
sudo nixos-rebuild switch --flake .#dvrcky
```

## Secrets

Secrets are encrypted with [SOPS](https://github.com/getsops/sops) and age.
The private age key is kept outside this repository at:

```text
~/.config/sops/age/keys.txt
```

The encrypted files in `secrets/` are safe to commit. Never commit the age
private key or an unencrypted secret.

If the age key is not available on a new installation, create one with:

```sh
mkdir -p ~/.config/sops/age
nix shell nixpkgs#age -c age-keygen -o ~/.config/sops/age/keys.txt
```

## sing-box

`sing-box` runs as a system service and handles the transparent proxy through
a TUN interface. Its Trojan/Reality password is provided by `sops-nix` at
activation time and is not stored in the Nix store.

Useful commands:

```sh
sudo systemctl status sing-box
sudo systemctl restart sing-box
sudo systemctl stop sing-box
```

## Layout

```text
flake.nix       Flake inputs and system entry point
nixos/          System-wide NixOS modules
home/           Home Manager modules
nixvim/         Neovim, plugins and keymaps
secrets/        Encrypted SOPS files
```

The hardware module contains machine-specific settings, including filesystem
UUIDs and NVIDIA configuration, so this repository is intended for this host.
