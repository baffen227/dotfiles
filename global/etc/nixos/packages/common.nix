{ pkgs, ... }:

{
  # Networking
  networking = {
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
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bagfen = {
    isNormalUser = true;
    description = "bagfen";

    # Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
    # Dialout group is used for USB serial coms: https://nixos.wiki/wiki/Serial_Console
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    stow
    tree
    wget
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
