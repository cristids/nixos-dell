{ config, pkgs, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./dell/drivers/hardware.nix
    ./dell/drivers/video.nix
    ./generic/configuration.nix
  ];

}