{ ... }:

{
  imports = [
    ./editors.nix
    ./fonts.nix
  ];

  # Allow non-free packages
  nixpkgs.config.allowUnfree = true;
}
