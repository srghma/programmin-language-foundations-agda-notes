{ pkgs ? import ./nix/pkgs.nix }:

with pkgs;

let
  pkg = agda.mkDerivation(self: {
    name = "MyPackage";
    src = ./.;
    everythingFile = "Main.agda";
    sourceDirectories = [ "." ];
    buildDepends = [ pkgs.AgdaStdlib ];
  });
in
  pkg
