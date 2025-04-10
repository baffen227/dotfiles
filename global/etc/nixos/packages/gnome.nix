{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Install Input Method Panel GNOME Shell Extensions to provide the input method popup.
    gnomeExtensions.kimpanel
    # Install Gnome Tweaks for remapping CapsLock to Ctrl
    gnome-tweaks
  ];

  # Excluding some GNOME applications from the default install
  # https://nixos.wiki/wiki/GNOME
  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-tour
    gnome-clocks
    gnome-contacts
    gnome-maps
    gnome-music
    gnome-weather
    gnome-calendar
    cheese # webcam tool
    epiphany # web browser
    geary # email reader
    totem # video player
    simple-scan # document scanner
    atomix # puzzle game
    hitori # sudoku game
    iagno # go game
    tali # poker game
    yelp
  ];
}
