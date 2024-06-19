{
  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

  };
  outputs = { self, nixpkgs, ... }: 
  let system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      ardugotools = import ./ardugotools.nix {inherit pkgs; };
      arduboy_toolset = import ./arduboy_toolset.nix {inherit pkgs; };
  in {
    packages.${system}.default = arduboy_toolset;
    devShells.${system}.default = pkgs.mkShell {
      packages = [ardugotools arduboy_toolset];
    };
  };
}
