# Edgedb-go flake

## Usage as a flake

[![FlakeHub](https://img.shields.io/endpoint?url=https://flakehub.com/f/dko1905/edgedb-go/badge)](https://flakehub.com/flake/dko1905/edgedb-go)

Add edgedb-go-flake to your `flake.nix`:

```nix
{
  inputs.edgedb-go.url = "https://flakehub.com/f/dko1905/edgedb-go/*.tar.gz";

  outputs = { self, edgedb-go }: {
    # Use edgedb-go.packages.go-edgeql in your outputs
  };
}

```
