{ pkgs }:
with pkgs;
[
  nodejs
  nodePackages.npm
  makeWrapper
]
