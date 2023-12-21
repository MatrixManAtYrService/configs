{ inputs, lib, config, pkgs, ... }: 

  let
    py-dev-env =  pkgs.python311.withPackages(ps: with ps; [
      python-lsp-server
      python-lsp-ruff
      #pylsp-rope
      #pudb
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
        #language-server.pylsp-ruff = {
        language-server.pylsp = {
          command = "pylsp";
          args = ["-v" "--log-file" "/Users/matt/pylsp.log"];
        };
        language = [
          {
            name = "python";
            formatter = { 
              command = "ruff-format"; 
            };
          }
        ];
      };
    };
  };
}
