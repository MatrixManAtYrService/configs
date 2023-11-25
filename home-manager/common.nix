{ inputs, lib, config, pkgs, ... }: {

  nixpkgs = {
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
    overlays = [
      (final: previous: {
        helix = inputs.helix.packages.${final.system}.helix;
      })
    ];
  };

 
  programs.home-manager.enable = true;

  home = with pkgs; {
    stateVersion = "23.05";
    username = "matt";
    homeDirectory = "/home/matt";
    packages = [
      silver-searcher
      jq
      gron
      nodePackages_latest.bash-language-server
      nodePackages_latest.yaml-language-server
      wget
      tree
      marksman
      fzf
      wezterm
      nushell
    ];


    file = {
      ".config/nushell/config.nu".source = ./nushell/config.nu;
      ".config/nushell/env.nu".source = ./nushell/env.nu;
    };
  };


  programs.git = {
    enable = true;
    userName = "Matt Rixman";
    userEmail = "MatrixManAtYrService@users.noreply.github.com";
    extraConfig = {
      core = {
        editor = "hx";
      };
    };
  };

  programs.helix = {
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
}
