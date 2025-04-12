
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./packages
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "crazy-diamond"; # Define your hostname.

  # system services
  services = {
    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      # Display Manager
      displayManager = {
        # Gnome's display manager
        gdm.enable = true;
        # Tweak to make Display Link docks accept more monitors
        #sessionCommands = ''
        #  xrandr --setprovideroutputsource 2 0
        #'';
      };
      # Enable the GNOME Desktop Environment.
      desktopManager.gnome.enable = true;
      # DisplayLink Dock compatibility
      #videoDrivers = [
      #  "displaylink"
      #  "modesetting"
      #];
      # Keyboard Layout
      xkb.layout = "us";
      xkb.variant = "";
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # libinput.enable = true;

    # HTTP Server
    #nginx = {
    #  enable = true;
    #  recommendedProxySettings = true;
    #  recommendedTlsSettings = true;
    #  # other Nginx options
    #  virtualHosts."localhost.com" = {
    #    #enableACME = true;
    #    forceSSL = false;
    #    locations."/" = {
    #      proxyPass = "http://127.0.0.1:8080";
    #      proxyWebsockets = true; # needed if you need to use WebSocket
    #      extraConfig =
    #        # required when the target is also TLS server with multiple hosts
    #        "proxy_ssl_server_name on;"
    #        +
    #          # required when the server wants to use HTTP Authentication
    #          "proxy_pass_header Authorization;";
    #    };
    #  };
    #};

    # This setups a SSH server. Very important if you're setting up a headless system.
    # Feel free to remove if you don't need it.
    #openssh = {
    #  enable = true;
    #  settings = {
    #    # Opinionated: forbid root login through SSH.
    #    PermitRootLogin = "no";
    #    # Opinionated: use keys only.
    #    # Remove if you want to SSH using passwords
    #    PasswordAuthentication = false;
    #  };
    #};
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
