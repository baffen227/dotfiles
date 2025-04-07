{ pkgs, ... }:
let
  unstable_pkgs = import <nixos-unstable> {};
in
{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    unstable_pkgs.zed-editor
  ];
}
