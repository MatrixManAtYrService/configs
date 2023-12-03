{ inputs, lib, config, pkgs, ... }: {

  home = with pkgs; {
    stateVersion = "23.05";
    packages = [
      silver-searcher
      jq
      gron
      nodePackages_latest.bash-language-server
      nodePackages_latest.yaml-language-server
      nil
      wget
      tree
      marksman
      fzf
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
      "nushell-confg" = {
        source = ./config/nushell;
        recursive = true;
        target = ".config/nushell";
      };
      "zoxide-config" = {
        source = ./config/zoxide;
        recursive = true;
        target = ".config/zoxide";
      };
    };
  };

  programs = {

    nushell = {
      enable = true;
      configFile.source = ./config/nushell/config.nu;
      envFile.source = ./config/nushell/env.nu;
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

    starship = {
      enable = true;
      enableNushellIntegration = true;
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
        core = {
          editor = "hx";
        };
      };
    };

    helix = {
      enable = true;
      settings = {
        theme = "tokyonight_storm";
        editor = {
          line-number = "relative";
          mouse = false;
          bufferline = "multiple";
          cursor-shape.insert = "bar";
        };
        keys = {
          normal = {
            esc = ["collapse_selection" "keep_primary_selection"];
            "C-j" = ["extend_to_line_bounds" "delete_selection" "paste_after"]; 
            "C-k" = ["extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before"]; 
          };
        };
      };
    };
  };
}
