{

	description = "My flake's config";

	inputs = {
	 nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
	 nixpkgs.url = "nixpkgs/nixos-24.05";
	 home-manager = {
	  url = "github:nix-community/home-manager";
	  inputs.nixpkgs.follows = "nixpkgs-unstable";
	  };
  stylix = {
    url = "github:danth/stylix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
 };
	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
	let
	   lib = nixpkgs.lib;
	   system = "x86_64-linux";
	   pkgs = nixpkgs-unstable.legacyPackages.${system};
	in {
	  nixosConfigurations = {
	    unix = lib.nixosSystem {
	      inherit system;
	      modules = [
		./nixos/configuration.nix
		inputs.stylix.nixosModules.stylix
    ];
   };
  };
	  homeConfigurations =  {
      zemo = home-manager.lib.homeManagerConfiguration {
	      inherit pkgs;
	      modules = [ ./home-manager/home.nix ];
   };
  };
 };
}
