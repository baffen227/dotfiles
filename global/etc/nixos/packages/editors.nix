{ pkgs, ... }:
let
  unstable_pkgs = import <nixos-unstable> {};
in
{
  environment.systemPackages = with pkgs; [
    neovim
    #unstable_pkgs.zed-editor
    zed-editor

    (unstable_pkgs.vscode-with-extensions.override {
      vscode = unstable_pkgs.vscodium;
      vscodeExtensions = with unstable_pkgs.vscode-extensions; [
        bbenoist.nix
        arrterian.nix-env-selector
        jnoortheen.nix-ide
        #ms-vscode-remote.remote-ssh # it's unfree, don't know how to fix, so disabled for now
        streetsidesoftware.code-spell-checker
        serayuzgur.crates
        editorconfig.editorconfig
        tamasfe.even-better-toml
        zhuangtongfa.material-theme
        rust-lang.rust-analyzer
        gruntfuggly.todo-tree
        vscodevim.vim
        redhat.vscode-yaml

      ] ++ unstable_pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        #{
        #  name = "remote-ssh-edit";
        #  publisher = "ms-vscode-remote";
        #  version = "0.47.2";
        #  sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
        #}
        {
          #me-dutour-mathieu.vscode-github-actions
          name = "vscode-github-actions";
          publisher = "me-dutour-mathieu";
          version = "3.0.1";
          sha256 = "I5qZk/svJIlnV2ggwMLu5Bfvly3vyshT5y51V4/nQLI=";
        }
        {
          #maattdd.gitless
          name = "gitless";
          publisher = "maattdd";
          version = "11.7.2";
          sha256 = "rYeZNBz6HeZ059ksChGsXbuOao9H5m5lHGXJ4ELs6xc=";
        }
        {
          #ecmel.vscode-html-css
          name = "vscode-html-css";
          publisher = "ecmel";
          version = "2.0.9";
          sha256 = "fDDVfS/5mGvV2qLJ9R7EuwQjnKI6Uelxpj97k9AF0pc=";
        }
        {
          #ms-vscode.remote-explorer
          name = "remote-explorer";
          publisher = "ms-vscode";
          version = "0.5.2024031109";
          sha256 = "t8CeOuoCaK8ecJqMXRx8kA4CtP0x4srcn2SCez5tHOU=";
        }
        {
          #wayou.vscode-todo-highlight
          name = "vscode-todo-highlight";
          publisher = "wayou";
          version = "1.0.5";
          sha256 = "CQVtMdt/fZcNIbH/KybJixnLqCsz5iF1U0k+GfL65Ok=";
        }
        {
          #Wokwi.wokwi-vscode
          name = "wokwi-vscode";
          publisher = "wokwi";
          version = "2.4.3";
          sha256 = "WDbukOWOyKfK6Q7Nq8J2cCfFSzDw4q0rvm3hD8SfJiA=";
        }
        {
          #probe-rs.probe-rs-debugger
          name = "probe-rs-debugger";
          publisher = "probe-rs";
          version = "0.24.1";
          sha256 = "sha256-Fb5a+sU+TahjhMTSCTg3eqKfjYMlrmbKyyD47Sr8qJY=";
        }
      ];
    })

  ];
}
