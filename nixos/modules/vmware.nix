{ config, pkgs, ... }:

{
  virtualisation.vmware.host.enable = true;
  virtualisation.vmware.guest.enable = true;
  boot.kernelParams = [ "transparent_hugepage=never" ];
}

