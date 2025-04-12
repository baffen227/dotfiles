{ pkgs, ... }:

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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Nix language server
    nil
    nixd
  ];
}
