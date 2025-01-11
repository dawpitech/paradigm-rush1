{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    packages = with pkgs; [
      gnumake
      ghc
      haskell-language-server
      haskellPackages.cabal-install
    ];
}
