{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # ===== Browser =====
    #chromium

    # ===== Communication =====
    element-desktop
    #telegram-desktop
    #discord
    #teams-for-linux
    # For line us this chrome extensions:
    ## https://chromewebstore.google.com/detail/line/ophjlpahpchlmihnnnihgmmeilfjmjjc?hl=zh-TW

    # ===== Terminal =====
    #alacritty
    #alacritty-theme
    ghostty # Fast, native, feature-rich terminal emulator pushing modern features

    # ===== Media =====
    ffmpeg
    flameshot # Powerful yet simple to use screenshot software
    foliate # Simple and modern GTK eBook reader
    #obs-studio # Free and open source software for video recording and live streaming
    #gimp-with-plugins # GNU Image Manipulation Program
    #libsForQt5.kdenlive # Video editor
    #inkscape-with-extensions # Vector graphics editor
    libreoffice-fresh # Comprehensive, professional-quality productivity suite, a variant of openoffice.org
    #steam
    vlc

    # ===== Networking =====
    #wireshark
    nettools # Set of tools for controlling the network subsystem in Linux

    # ===== System Tools =====
    gparted # Graphical disk partitioning tool
    #ventoy-full # New Bootable USB Solution
    mkcert # Simple tool for making locally-trusted development certificates
    xorg.xeyes # Used to check if an app is using Xwayland or Wayland

    # networking tools
    #mtr # A network diagnostic tool
    #iperf3
    #dnsutils  # `dig` + `nslookup`
    #ldns # replacement of `dig`, it provide the command `drill`
    #aria2 # A lightweight multi-protocol & multi-source command-line download utility
    #socat # replacement of openbsd-netcat
    #nmap # A utility for network discovery and security auditing
    #ipcalc  # it is a calculator for the IPv4/v6 addresses
    #hugo # static site generator
  ];
}
