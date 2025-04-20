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

  environment.systemPackages = with pkgs; [
    cowsay # Program which generates ASCII pictures of a cow with a message
    eza # Modern, maintained replacement for ls
    file # Program that shows the type of files
    fzf # Command-line fuzzy finder written in Go
    gawk # GNU implementation of the Awk programming language
    git
    gnused # GNU sed, a batch stream editor
    gnutar # GNU implementation of the `tar' archiver
    gnupg # Modern release of the GNU Privacy Guard, a GPL OpenPGP implementation
    lazygit # Simple terminal UI for git commands
    neofetch # Fast, highly customizable system info script
    nnn #  Small ncurses-based file browser forked from noice
    ripgrep # Utility that combines the usability of The Silver Searcher with the raw speed of grep
    stow # Tool for managing the installation of multiple software packages in the same run-time directory tree
    tree # Command to produce a depth indented directory listing
    vim
    wget
    which # Shows the full path of (shell) commands
    zstd # Zstandard real-time compression algorithm

    # it provides the command `nom` works just like `nix` with more details log output
    nix-output-monitor # Processes output of Nix commands to show helpful and pretty information

    # archives
    p7zip # New p7zip fork with additional codecs and improvements (forked from https://sourceforge.net/projects/p7zip/)
    unzip # Extraction utility for archives compressed in .zip format
    xz # General-purpose data compression software, successor of LZMA
    zip # Compressor/archiver for creating and modifying zipfiles

    # Markdown, JSON, YAML procesors
    glow # Render markdown on the CLI, with pizzazz!
    jq # A lightweight and flexible command-line JSON processor
    yq-go # Portable command-line YAML processor, https://github.com/mikefarah/yq

    # monitors and tracers
    btop # Monitor of resources, replacement of htop/nmon
    iftop # Display bandwidth usage on a network interface
    iotop # Tool to find out the processes doing the most IO
    lsof # Tool to list open files
    ltrace # Library call tracer
    strace # System call tracer for Linux

    # system tools
    ethtool # Utility for controlling network drivers and hardware
    lm_sensors # Tools for reading hardware sensors, for `sensors` command
    pciutils # Collection of programs for inspecting and manipulating configuration of PCI devices, such as lspci
    sysstat # Collection of performance monitoring tools for Linux (such as sar, iostat and pidstat)
    usbutils # Tools for working with USB devices, such as lsusb
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
