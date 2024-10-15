{
  # Based upon templates#go-hello
  description = "go-edgeql package flake";

  # Nixpkgs / NixOS version to use.
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      # System types to support (not tested).
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {
      # Provide some binary packages for selected system types.
      packages = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          go-edgeql = pkgs.buildGoModule rec {
            pname = "go-edgeql";
            version = "0.17.0";

            src = pkgs.fetchFromGitHub {
              owner = "edgedb";
              repo = "edgedb-go";
              rev = "v${version}";
              sha256 = "sha256-NfC1ufHZn0sTFYj4+5t5rY6XPuKtBTmIH6nTBy7Sg5s=";
            };

            # proxyVendor = true; # darwin/linux hash mismatch
            vendorHash = "sha256-hQX+1AZfJ2pzTfCbwFL7nOMz3WddSmzR2Lkb80oKW38=";

            subPackages = [ "cmd/edgeql-go" ];

            tags = [ ];

            doCheck = false;

            meta = with pkgs.lib; {
              homepage = "https://github.com/edgedb/edgedb-go";
              description = "The official Go client library for EdgeDB";
              maintainers = with maintainers; [];
              license = licenses.apache;
              mainProgram = "edgeql-go";
            };
          };
      });

      # The default package for 'nix build'. This makes sense if the
      # flake provides only one package or there is a clear "main"
      # package.
      defaultPackage = forAllSystems (system: self.packages.${system}.go-edgeql);
    };
}
