{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  
  callPackage = pkgs.lib.callPackageWith (pkgs // pkgs.xlibs // pkgs.python3Packages // self);
  
  self = {
    vivado = callPackage ./pkgs/vivado { };
    migen = callPackage ./pkgs/migen { };
  };
in
self
