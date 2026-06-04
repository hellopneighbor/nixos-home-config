{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    telegram-desktop
    nix-prefetch-scripts
    p7zip
    blender
    lmms
    fastfetch
    dosbox-x
    python314
    yandex-music
    virtualbox
    jdk21
    wineWow64Packages.stable
    winetricks
    qbittorrent
    lutris
    obs-studio
    simplescreenrecorder
    ];

}
