{
  description = "CSFML 2.6.1";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs   = nixpkgs.legacyPackages.${system};

    sfml261 = pkgs.callPackage ./sfml.nix {};
    csfml261 = pkgs.callPackage ./csfml.nix { inherit sfml261; };

  in {
    packages.${system} = {
      sfml  = sfml261;
      csfml = csfml261;
      default = csfml261;
    };

    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [ sfml261 csfml261 pkgs.cmake pkgs.gcc ];

      shellHook = ''
        export NIX_LDFLAGS="''${NIX_LDFLAGS:-} -L${csfml261}/lib -L${sfml261}/lib"
        export C_INCLUDE_PATH="${csfml261}/include:${sfml261}/include''${C_INCLUDE_PATH:+:''${C_INCLUDE_PATH}}"
        export CPATH="${csfml261}/include:${sfml261}/include''${CPATH:+:''${CPATH}}"
        echo "CSFML 2.6.1"
        echo "Headers: ${csfml261}/include"
        echo "Libs: ${csfml261}/lib"
      '';
    };
  };
}