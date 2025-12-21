{ pkgs, ... }: {
  nixpkgs.config.allwUnfree = true;
  environment.systemPackages = with pkgs; [
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
