{
  inputs = {
    nixpkgs.url = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
  in {
    packages.${system}.dwl = nixpkgs.legacyPackages.${system}.dwl.overrideAttrs (
      old: {
        src = builtins.path {
          name = "dwl-source";
          path = ./.;
        };
      }
      );
  };
}
