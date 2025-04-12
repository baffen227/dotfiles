
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # List packages installed in system profile. To search, run:
      # $ nix search wget
      ./packages

      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking = {
    hostName = "echoes"; # Define your hostname.

    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
    firewall = {
      # Open ports in the firewall.
      allowedTCPPorts = [
        443
        80
      ];

      # if packets are still dropped, they will show up in dmesg
      logReversePathDrops = true;

      # Here is a trick to let our device route all traffice through Wireguard
      # cf: https://nixos.wiki/wiki/WireGuard
      # wireguard trips rpfilter up
      #extraCommands = ''
      #  ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN
      #  ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN
      #'';
      #extraStopCommands = ''
      #  ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN || true
      #  ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN || true
      #'';
    };
  };

  # Set your time zone.
  time.timeZone = "Asia/Taipei";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "zh_TW.UTF-8";
      LC_IDENTIFICATION = "zh_TW.UTF-8";
      LC_MEASUREMENT = "zh_TW.UTF-8";
      LC_MONETARY = "zh_TW.UTF-8";
      LC_NAME = "zh_TW.UTF-8";
      LC_NUMERIC = "zh_TW.UTF-8";
      LC_PAPER = "zh_TW.UTF-8";
      LC_TELEPHONE = "zh_TW.UTF-8";
      LC_TIME = "zh_TW.UTF-8";
    };

    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-chewing
        fcitx5-gtk
      ];
    };
  };

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

    # Enable CUPS to print documents.
    printing = {
      enable = true;
      drivers = [
        pkgs.foomatic-db
        pkgs.foomatic-db-ppds
      ];
    };

    # Pipewire sound server
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
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

    udev.packages = [
      # Used to set udev rules to access ST-LINK devices from probe-rs
      pkgs.openocd
    ];

    # Add a udev rule to connect CANable for updating its firmware
    udev.extraRules = ''
      SUBSYSTEMS=="usb", ATTR{idVendor}=="0483", ATTR{idProduct}=="df11", MODE:="0666"
    '';
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Virtualization (Containers and VMs)
  virtualisation = {
    containers.enable = true;
    docker.enable = true;
  };

  # Enable Saleao Logic Analyzer support
  hardware.saleae-logic = {
    enable = true;
  };

  programs = {
    # Install firefox.
    firefox.enable = true;

    # Enable appimage-run wrapper script and binfmt registration
    appimage = {
      # Whether to enable appimage-run wrapper script for executing appimages on NixOS.
      enable = true;
      # Whether to enable binfmt registration to run appimages via appimage-run seamlessly.
      binfmt = true;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bagfen = {
    isNormalUser = true;
    description = "bagfen";

    # Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
    # Dialout group is used for USB serial coms: https://nixos.wiki/wiki/Serial_Console
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    stow
    tree
    wget

    # Nix language server
    nil
    nixd
  ];

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
