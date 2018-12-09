{ pkgs ? import (import ./nix/nixpkgs) {} }:

with pkgs;

let
  pkg = agda.mkDerivation(self: {
    name = "MyPackage";
    src = ./.;
    buildDepends = [ pkgs.AgdaStdlib ];
  });
in
  pkg.env
