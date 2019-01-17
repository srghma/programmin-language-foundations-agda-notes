let
  nixpkgs = import ./nixpkgs;

  config = { allowUnfree = true; };

  overlays = [
    (import ./pkgs/overlay.nix)
  ];
in import nixpkgs { inherit config overlays; }
