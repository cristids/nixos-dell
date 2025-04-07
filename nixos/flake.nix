{
  description = "config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {

    nixosConfigurations.gpdp4-nix = nixpkgs.lib.nixosSystem {
      # NOTE: Change this to aarch64-linux if you are on ARM
      system = "x86_64-linux";
      modules = [
        ./dell/drivers/hardware.nix
        ./dell/drivers/video.nix
        ./generic/configuration.nix

        # # make home-manager as a module of nixos
        # # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
        # home-manager.nixosModules.home-manager
        # {
        #   home-manager.useGlobalPkgs = true;
        #   home-manager.useUserPackages = true;
        #   home-manager.backupFileExtension = "hm-bkp";

        #   # TODO replace ryan with your own username
        #   home-manager.users.cristian = import ./generic/home.nix;

        #   # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
        # }
      ];
    };

  };
}
