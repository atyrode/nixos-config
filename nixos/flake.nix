{
    description = "Flake of atyrode";

    inputs = { 
        nixpkgs.url = "nixpkgs/nixos-23.11";
    };

    outputs = { self, nixpkgs, ... }:
    let lib = nixpkgs.lib;
    in {
        nixosConfigurations = {
            alex-pc = lib.nixosSystem {
                system = "x86_64-linux";
                modules = [ ./alex-pc.nix ];
            };
        };
    };
}
