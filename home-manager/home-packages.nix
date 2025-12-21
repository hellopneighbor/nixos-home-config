{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    telegram-desktop
    nix-prefetch-scripts
    p7zip
    blender
    lmms
    fastfetch
    jetbrains.pycharm-community-src
    dosbox-x
    python314
    yandex-music
    virtualbox
    jdk21
    wineWowPackages.stable
    winetricks
    qbittorrent
    lutris
    obs-studio
    simplescreenrecorder
    htop
    iotop
    iftop
    usbutils
    ];

}
