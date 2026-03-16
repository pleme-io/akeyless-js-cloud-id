{
  description = "Akeyless CloudId Provider for authenticating via cloud authorization providers (AWS, Azure, GCP)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.default = pkgs.buildNpmPackage {
        pname = "akeyless-cloud-id";
        version = "0.0.0-dev";
        src = self;
        npmFlags = [ "--legacy-peer-deps" ];
        npmDepsHash = "sha256-F+ga7VMfOFRrb8zv2CaLqea4NNt0TGTbbolYLbEscXw="; # TODO: set correct hash
        dontNpmBuild = true;
        meta = {
          description = "Akeyless CloudId Provider for authenticating via cloud authorization providers (AWS, Azure, GCP)";
          homepage = "https://github.com/pleme-io/akeyless-js-cloud-id";
          license = pkgs.lib.licenses.isc;
        };
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ nodejs_22 ];
      };
    });
}
