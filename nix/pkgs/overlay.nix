pkgs: pkgsOld:
{
  plfa         = pkgs.callPackage ./plfa {};
  readRevision = pkgs.callPackage ./readRevision {};
}
