{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, ansi-terminal, base, colour, stdenv, x24-bit
      }:
      mkDerivation {
        pname = "haskell-solarized";
        version = "0.1.0.0";
        src = ./.;
        libraryHaskellDepends = [ ansi-terminal base colour x24-bit ];
        license = stdenv.lib.licenses.mit;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f {
    x24-bit = haskellPackages.callPackage (import ./24-bit) {};
  };

in

  if pkgs.lib.inNixShell then drv.env else drv
