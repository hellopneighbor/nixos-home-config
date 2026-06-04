{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: let
    system = "x86_64-linux";
    homeStateVersion = "26.05";
    user = "eugen";
    hosts = [
      { hostname = "nixbook"; stateVersion = "26.05"; bootdevice = "/dev/sda"; mountpoint="/boot"; }
      { hostname = "nixos"; stateVersion = "26.05"; bootdevice = "nodev"; mountpoint="/boot/efi"; }
    ];

    makeSystem = { hostname, stateVersion, bootdevice, mountpoint}: nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {
        inherit inputs stateVersion hostname user bootdevice mountpoint;
      };

      modules = [
        ./hosts/${hostname}/configuration.nix
      ];
    }; # ИСПРАВЛЕНО: Добавлена точка с запятой перед 'in'

  in {
    nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
      configs // {
        "${host.hostname}" = makeSystem {
          inherit (host) hostname stateVersion bootdevice mountpoint;
        };
      }) {} hosts;

    homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit inputs homeStateVersion user;
      };

      modules = [
        ./home-manager/home.nix
      ];
    };
  };
}
