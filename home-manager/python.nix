{ inputs, lib, config, pkgs, ... }: 

  let
    py-dev-env =  pkgs.python311.withPackages(ps: with ps; [
      python-lsp-server
      ruff-lsp
      pylsp-rope
      pudb
    ]);
  in {
    

  home = with pkgs; {
    stateVersion = "23.05";
    packages = [
      py-dev-env
      ruff
    ];
  };

  programs = {

    helix = {
      enable = true;

      languages = {
        language-server = {
          "ruff-lsp" = {
            command = "${pkgs.ruff-lsp}/bin/ruff-lsp";
            args = [ ];
          };
          "pylsp" = {
            command = "${pkgs.python311Packages.python-lsp-server}/bin/pylsp";
            args = [ ];
          };
          "pylsp-mypy" = {
            command = "${pkgs.python311Packages.pylsp-mypy}";
            args = [ ];
          };
        };
        language = [
          {
            name = "python";
            language-servers = [ "ruff-lsp" "pylsp" "pylsp-mypy"];
            formatter = { 
              command = "${pkgs.ruff}/bin/ruff-format"; 
            };
          }
        ];
      };
    };
  };
}
