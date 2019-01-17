{ agda, maintainers, stdenv, fetchFromGitHub, readRevision, ... }:

let
  src = fetchFromGitHub (
    readRevision ./revision.json
  );

  plfa = agda.mkDerivation (self: {
    name = "plfa";

    inherit src;

    topSourceDirectories = [ "src" ];

    meta = with stdenv.lib; {
      license = stdenv.lib.licenses.mit;
      platforms = stdenv.lib.platforms.unix;
      maintainers = with maintainers; [ srghma ];
    };
  });
in
  plfa
