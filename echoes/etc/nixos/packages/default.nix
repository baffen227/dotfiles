{ ... }:

{
  imports = [
    ./editors.nix
  ];

  # Allow non-free packages
  nixpkgs.config.allowUnfree = true;
}
