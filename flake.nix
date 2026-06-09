{
  description = "Akeyless CloudId Provider for authenticating via cloud authorization providers (AWS, Azure, GCP)";
  inputs = {
    nixpkgs.follows = "substrate/nixpkgs";
    substrate = { url = "github:pleme-io/substrate";};
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "npm";
    builder = "package";
    pname = "akeyless-cloud-id";
    npmDepsHash = "sha256-F+ga7VMfOFRrb8zv2CaLqea4NNt0TGTbbolYLbEscXw=";
    dontNpmBuild = true;
    npmFlags = [ "--legacy-peer-deps" ];
    description = "Akeyless CloudId Provider for authenticating via cloud authorization providers (AWS, Azure, GCP)";
  };
}
