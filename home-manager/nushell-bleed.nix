{ lib, pkgs, inputs, ... }:

let
  nushell-bleed = pkgs.rustPlatform.buildRustPackage {
    pname = "nushell";
    version = "from-flake";
    src = inputs.nushell;

    cargoLock = {
      lockFile = "${inputs.nushell}/Cargo.lock";
      outputHashes = {
        "reedline-0.35.0" = "sha256-24NkxDKGT3fBEt6VgWaebqV2FNdTb8SGo1mqPL5wcl0=";
      };
    };

    nativeBuildInputs = [ pkgs.pkg-config ]
      ++ lib.optionals pkgs.stdenv.isDarwin [ pkgs.rustPlatform.bindgenHook ];

    buildInputs = with pkgs; [
      openssl
      zstd
    ] ++ lib.optionals stdenv.isDarwin ([
      zlib
      darwin.Libsystem
      darwin.apple_sdk.frameworks.Security
      darwin.apple_sdk.frameworks.CoreFoundation
      darwin.apple_sdk.frameworks.CoreServices
      darwin.apple_sdk.frameworks.Foundation
      darwin.apple_sdk.frameworks.AppKit
      nghttp2
      libgit2
    ]);

    # Disable tests for now, as per Nixpkgs
    doCheck = false;

    env = {
      OPENSSL_NO_VENDOR = 1;
      LIBGIT2_NO_VENDOR = 1;
    };

    meta = with pkgs.lib; {
      description = "A new type of shell";
      homepage = "https://www.nushell.sh/";
      license = licenses.mit;
      maintainers = with maintainers; [ Br1ght0ne johntitor ];
      mainProgram = "nu";
    };
  };

in
{
  programs.nushell.package = nushell-bleed;
}
