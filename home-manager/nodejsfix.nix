
{ ... }: {
  home = {
    nixpkgs.overlays = [
     (self: super: {
        nodejs = super.nodejs_22;
        nodejs-slim = super.nodejs-slim_22;
     })
    ];
  };
}

