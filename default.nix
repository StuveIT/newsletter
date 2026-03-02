{
  pkgs,
}:

pkgs.stdenv.mkDerivation rec {
  pname = "stuve-newsletter";
  version = "1.1.0";

  src = [
    ./compile.sh
    ./template
    ./utils
  ];

  buildInputs = (
    import ./dependencies.nix {
      inherit pkgs;
    }
  );

  unpackCmd = ''
    mkdir test-src
    cp $currSrc test-src/test.sh
  '';

  buildPhase = ''
    cd utils
    npm i
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    ls $curSrc
    ls $TMP/${pname}
    mv $TMP/${pname}/compile.sh $out/bin/stuve-newsletter
    chmod +x $out/bin/stuve-newsletter

    runHook postInstall
  '';

  meta = with pkgs.lib; {
    description = "A newsletter template for the Student Representation of the University of Konstanz";
    homepage = "https://github.com/StuVeIT/newsletter";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
