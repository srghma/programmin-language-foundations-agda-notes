{ pkgs ? import ./nix/pkgs.nix }:

with pkgs;

let
  myagda = agda.withPackages [ agdaPackages.standard-library ];

  pkg = mkShell {
    name = "MyPackage";
    buildInputs = [ myagda ];
  };
in
  pkg
