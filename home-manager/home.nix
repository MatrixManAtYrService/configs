{ inputs, lib, config, pkgs, ... }: {

  nixpkgs = {
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

 
  home = with pkgs; {
    stateVersion = "23.05";
    username = "matt";
    homeDirectory = "/home/matt";
    packages = [
      silver-searcher
      jq
      gron
      nil
      nim
      nodePackages_latest.bash-language-server
      nodePackages_latest.yaml-language-server
      wget
      tree
    ];
    file = {
        ".ipython/profile_default/ipython_config.py".text = ''
           c.TerminalInteractiveShell.editing_mode = 'vi'
       '';
      };

  };

  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

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
          };
      };
    };
  };

  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    plugins = [
      {
        name = "today";
        src = ./zsh_functions;
        file = "today.zsh";
      }
      {
        name = "vi-zle";
        src = ./zsh_functions;
        file = "vi_zle.zsh";
      }
      {
       name = "pure";
        src = pkgs.fetchFromGitHub {
        owner = "sindresorhus";
      	repo = "pure";
      	rev  = "v1.20.1";
      	sha256 = "1bxg5i3a0dm5ifj67ari684p89bcr1kjjh6d5gm46yxyiz9f5qla";
        };
      }
    ];
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

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  
  systemd.user.startServices = "sd-switch";
}
