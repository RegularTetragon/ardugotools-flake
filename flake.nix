{
  inputs = {};
  outputs = { self, nixpkgs, ... }: 
  let system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      ardugotools = import ./ardugotools.nix {inherit pkgs; };
  in {
    packages.${system}.default = ardugotools;
    devShells.${system}.default = pkgs.mkShell {
      packages = [ardugotools];
    };
  };
}
