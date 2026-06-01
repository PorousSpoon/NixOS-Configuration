{
description = "[14:35 1 June, 2026]: First Flake with i3 and Ly.";
inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
	home-manager = {
		url = "github:nix-community/home-manager/release-26.05";
		inputs.nixpkgs.follows = "nixpkgs";
	};
};
outputs = { self, nixpkgs, home-manager, ... }: {
	nixosConfigurations.nixos-hp-spectre = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		modules = [ ./configuration.nix ];
	};
	homeConfigurations.north = home-manager.lib.homeManagerConfiguration {
		pkgs = nixpkgs.legacyPackages.x86_64-linux;
		modules = [ ./home.nix ];
	};
};
}
