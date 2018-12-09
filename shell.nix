{ pkgs ? import (import ./nix/nixpkgs) {} }:

with pkgs;

let
  pkg = agda.mkDerivation(self: {
    name = "MyPackage";
    buildDepends = [ pkgs.AgdaStdlib ];
  });
in
  pkg.env
