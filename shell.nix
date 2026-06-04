{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    pandoc
  ];

  shellHook = ''
    cd utils
    npm i
    cd ..
  '';
}
