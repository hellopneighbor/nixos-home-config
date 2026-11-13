{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages_6_12;
  boot.kernelModules = [ "tun" ];
}

