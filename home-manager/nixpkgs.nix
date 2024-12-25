{ ... }: 

{
    

  home ={
    stateVersion = "23.05";


  file.".config/nixpkgs/config.nix".text = 
    ''
    {
      allowUnfree = true;
    }
    '';
  };
}
