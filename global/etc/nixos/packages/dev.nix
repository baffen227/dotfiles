{ pkgs, ... }:
let
  unstable_pkgs = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };
in
{
  # system services
  services = {
    udev.packages = [
      # Used to set udev rules to access ST-LINK devices from probe-rs
      pkgs.openocd
    ];

    # Add a udev rule to connect CANable for updating its firmware
    udev.extraRules = ''
      SUBSYSTEMS=="usb", ATTR{idVendor}=="0483", ATTR{idProduct}=="df11", MODE:="0666"
    '';
  };

  # Virtualization (Containers and VMs)
  virtualisation = {
    containers.enable = true;
    docker.enable = true;
  };

  # Enable Saleao Logic Analyzer support
  hardware.saleae-logic = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    unstable_pkgs.claude-code # Agentic coding tool that lives in your terminal, understands your codebase, and helps you code faster
    docker-compose # Docker CLI plugin to define and run multi-container applications with Docker
    hoppscotch # Open source API development ecosystem, Postman Open-Source Alternative
    nil # Yet another language server for Nix
    nixd # Feature-rich Nix language server interoperating with C++ nix
    nixfmt-rfc-style # Official formatter for Nix code
    nixpkgs-fmt # Nix code formatter for nixpkgs
    saleae-logic-2
    stm32cubemx
  ];
}
