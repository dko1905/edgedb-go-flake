# Edgedb-go flake
[Documentation](https://pkg.go.dev/github.com/edgedb/edgedb-go)

## Usage as a flake

[![FlakeHub](https://img.shields.io/endpoint?url=https://flakehub.com/f/dko1905/edgedb-go/badge)](https://flakehub.com/flake/dko1905/edgedb-go)

Add edgedb-go-flake to your `flake.nix`:

```nix
{
  inputs.edgedb-go.url = "https://flakehub.com/f/dko1905/edgedb-go/v0.17.2-20241015-002.tar.gz";
  # or
  inputs.edgedb-go.url = "github:dko1905/edgedb-go-flake/v0.17.2-20241015-002";

  outputs = { self, edgedb-go }: {
    # Use edgedb-go.packages.go-edgeql in your outputs
  };
}

```
