{

	description = "My flake's config";

	inputs = {
	  nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
	  nixpkgs.url = "nixpkgs/nixos-24.05";
	  home-manager = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows = "nixpkgs-unstable";
	  };
	  nixos-dotf = {
	   url = "git+ssh://git@github.com:jank5/nixosconf";
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
