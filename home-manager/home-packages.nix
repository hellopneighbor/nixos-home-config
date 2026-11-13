{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    telegram-desktop
    nix-prefetch-scripts
    p7zip
    blender
    python314
    wineWow64Packages.stable
    winetricks
    qbittorrent
    lutris
    appimage-run
    # neovim comes from the lazyvim-nix module — a second build here
    # conflicts in home-manager-path (two nvim binaries in buildEnv)
    steam
    steam-run
    android-tools
    libimobiledevice
    heimdall-gui
    google-chrome
    firefox
    filezilla
    btop
    basiliskii
    hydralauncher
    libreoffice
    gparted
    exfatprogs
    ntfs3g
    xournalpp
    rnote
    mangohud
    fastfetch
    zsh-powerlevel10k
    python313Packages.ipython
    liberation_ttf
    ];
}
