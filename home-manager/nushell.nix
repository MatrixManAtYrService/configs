{ lib, pkgs, inputs, ... }:

let
  # Extract the Rust version from Nushell's `rust-toolchain.toml`
  rustChannel = let
    rustToolchain = builtins.fromTOML (builtins.readFile "${inputs.nushell}/rust-toolchain.toml");
  in
    rustToolchain.toolchain.channel;

  # Set up crane with the specific Rust version
  craneLib = (inputs.crane.mkLib pkgs).overrideToolchain 
    (pkgs.rust-bin.stable.${rustChannel}.default);

  # Create a function that will be called with the necessary dependencies
  nuShellExpression = { pkg-config, openssl, lib, stdenv, libiconv }:
    let
      commonArgs = {
        src = lib.cleanSource inputs.nushell;
        strictDeps = true;
        OPENSSL_STATIC = 0;

        # Dependencies for the build platform
        nativeBuildInputs = [
          pkg-config
        ] ++ lib.optionals stdenv.buildPlatform.isDarwin [
          libiconv
        ];

        # Dependencies for the target platform
        buildInputs = [
          openssl
        ];
      };

      # Build Nushell dependencies
      cargoArtifacts = craneLib.buildDepsOnly (commonArgs // {
        pname = "nu-deps";
      });

      # Build the Nushell crate
      nuCrate = craneLib.buildPackage (commonArgs // {
        pname = "nushell";
        version = "0.104.0";
        cargoArtifacts = cargoArtifacts;
        cargoExtraArgs = "--features default";
        doCheck = false; # Disable tests for now
        passthru = {
          shellPath = "/bin/nu";
        };
      });
    in nuCrate;

  # Call the expression with the necessary dependencies
  nuShell = pkgs.callPackage nuShellExpression { };

in
{
  programs.nushell = {
    package = nuShell;
    enable = true;

    # Configuration files for Nushell
    configFile.source = ./config/nushell/config.nu;
    envFile.source = ./config/nushell/env.nu;
  };
}
