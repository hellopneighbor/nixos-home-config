{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
      git
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
      usbutils
    ];
}
