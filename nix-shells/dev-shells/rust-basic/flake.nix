{
  description = "A front-end dev-shell flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in 
  {
    devShells."x86_64-linux".default = pkgs.mkShell {
        #shellHook = ''
        #zsh
        #'';

      packages = [ 
          pkgs.pkg-config pkgs.openssl
          pkgs.rustup pkgs.tailwindcss
          pkgs.trunk pkgs.cargo-watch
          pkgs.bacon
          pkgs.neovim pkgs.zsh
      ];
    };
  };
}
