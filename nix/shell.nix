{ nixpkgsFn ? import ./nixpkgs.nix
, system ? null }:
let nixpkgs = nixpkgsFn ({
      # extra config goes here
    } // ( if system == null then {} else { inherit system; } ));
    source = toString ../.;
    bear-lib-terminal = nixpkgs.callPackage ./bear-lib-terminal {};
in
nixpkgs.stdenv.mkDerivation {
  name = "spaceship-os-game";
  nativeBuildInputs = with nixpkgs; [
    rustc cargo
    bear-lib-terminal
  ];
  src = source;

  builder = builtins.toFile "builder.sh" ''
    echo "======"
    echo $src
    exit 1
  '';

  RUST_BACKTRACE = 1;
}
