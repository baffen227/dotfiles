{ ... }:

{
  imports = [
    ./common.nix
    ./dev.nix
    ./editors.nix
    ./fonts.nix
    ./gnome.nix
  ];

  # Allow non-free packages
  nixpkgs.config.allowUnfree = true;
}
