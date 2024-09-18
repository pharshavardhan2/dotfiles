{
  description = "rust development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in
    {
      devShells."${system}".default =
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        pkgs.mkShell {
          name = "rust";
          packages = with pkgs; [
            rustup
          ];

          shellHook = ''
            echo "rust `${pkgs.rustup}/bin/rustc --version`"
            exec fish
          '';
        };
    };
}
