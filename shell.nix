with import <nixpkgs> {};

  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs.buildPackages; [ virtualenv ];

    NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
      stdenv.cc.cc
      zlib
    ];
    NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";

    shellHook = ''
      export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
    '';

    shellHooks = ''
      # make env if not already there
      if [ ! -d env ]; then
	echo "Creating virtualenv"
	virtualenv env
      fi

      echo "Sourcing virtualenv"
      source env/bin/activate
    '';
}

