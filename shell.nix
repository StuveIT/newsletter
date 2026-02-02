{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    nodePackages.npm
    pandoc
  ];

  shellHook = ''
    cd utils
    npm i
    cd ..
  '';
}
