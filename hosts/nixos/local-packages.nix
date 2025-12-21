{ pkgs, ... }: {
  nixpkgs.config.allwUnfree = true;
  environments.systemPackages = with pkgs; [
      gnumake
      busybox
      gnumake
      screen
      tio
      zsh
      mesa-demos
      vim
      htop
      iotop
      iftop
    ];
}
