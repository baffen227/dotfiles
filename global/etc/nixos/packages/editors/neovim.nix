{ pkgs, ... }:

let
  pluginPackages = import ./neovim/plugins/packages.nix { inherit pkgs; };
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    configure = {
      customRC =
        (import ./neovim/settings/options.nix)
        + (import ./neovim/keymaps/default.nix)
        + (import ./neovim/plugins/configs.nix);

      packages.myVimPackage = {
        start =
          pluginPackages.essential
          ++ pluginPackages.navigation
          ++ pluginPackages.git
          ++ pluginPackages.language
          ++ pluginPackages.lsp
          ++ pluginPackages.ui
          ++ pluginPackages.utilities;
      };
    };
  };
}
