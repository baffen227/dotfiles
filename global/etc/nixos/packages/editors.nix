{ pkgs, ... }:
let
  nixos-unstable = import <nixos-unstable> {};
in
{
  environment.systemPackages = with pkgs; [
    neovim
    nixos-unstable.zed-editor
    vim
  ];
}
