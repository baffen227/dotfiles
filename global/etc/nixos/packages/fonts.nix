{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ttf-tw-moe # Set of KAI and SONG fonts from the Ministry of Education of Taiwan
  ];

  # For fine grained Font control (can set a font per language!) see: https://nixos.wiki/wiki/Fonts
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji-blob-bin
      source-code-pro
      font-awesome
      (nerdfonts.override { fonts = [ "Hack" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "Hack Nerd Font Mono"
          "Source Code Pro"
          "Noto Sans Mono CJK TC"
          "DejaVu Sans Mono"
        ];
        sansSerif = [
          "Noto Sans CJK TC"
          "DejaVu Sans"
        ];
        serif = [
          "Noto Serif CJK TC"
          "DejaVu Serif"
        ];
      };
    };
  };
}
