{ pkgs ? import (import ./nix/nixpkgs) {} }:

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
