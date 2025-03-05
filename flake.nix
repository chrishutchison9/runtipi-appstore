{
  description = "DevShell for Runtipi with Nix Flakes and Direnv";

  # Use a compatible nixpkgs version
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";  # Choose a compatible nixpkgs version for your project
    flake-utils.url = "github:numtide/flake-utils";
  };

  # Define outputs (what gets built)
  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachSystem ["x86_64-linux" "aarch64-darwin"] (system: let
      # Define the devShell
      pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.git
            pkgs.nodejs
            pkgs.yarn
            pkgs.pnpm
          ];
        };
      });
}
