{ pkgs, ... }:
{
  home = with pkgs; {
    stateVersion = "23.05";
    packages = [
      git
      silver-searcher
      jq
      yq-go
      gron
      nodePackages_latest.bash-language-server
      nodePackages_latest.yaml-language-server
      dockerfile-language-server-nodejs
      vscode-langservers-extracted
      marksman
      nil
      wget
      tree
      marksman
      fzf
      nix-direnv
      asciinema
      nixpkgs-fmt
      bat
      tmux
      zsh
      zellij
    ];

    file = {
      "today" = {
        source = bin/today;
        target = ".bin/today";
      };
      "starship-config" = {
        source = ./config/starship.toml;
        target = ".config/starship.toml";
      };
    };
  };

  programs = {
    # nushell = import ./nushell.nix {
    #   inherit lib pkgs inputs;
    # };

    starship = {
      enable = true;
      enableNushellIntegration = true;
    };

    direnv = {
      enable = true;
      enableNushellIntegration = true;
      nix-direnv.enable = true;
    };


    # enable after: 
    #zoxide = {
    #enable = true;
    #enableNushellIntegration = true;
    #};

    git = {
      enable = true;
      userName = "Matt Rixman";
      userEmail = "MatrixManAtYrService@users.noreply.github.com";
      extraConfig = {
        "url \"git@github.com:\"".insteadOf = "https://github.com/";
        core = {
          editor = "hx";
        };
      };
    };

    helix = {
      enable = true;
      settings = {
        theme = "gruvbox";
        editor = {
          line-number = "relative";
          mouse = false;
          bufferline = "multiple";
          cursor-shape.insert = "bar";
        };
        keys = {
          normal = {
            "C-j" = [ "extend_to_line_bounds" "delete_selection" "paste_after" ];
            "C-k" = [ "extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before" ];
          };
        };
      };
    };
  };
}
