{ pkgs, ... }:

{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    qt6.qtbase
    qt6.qtdeclarative
    qt6Packages.qca
    libsForQt5.qt5.qtbase
    libvncserver
    xorg.libX11
    xorg.libXext
    xorg.libXrandr
    xorg.libXinerama
    xorg.libXcursor
    xorg.libXtst
    xorg.libXfixes
    libfakekey
    openssl
    cyrus_sasl
    openldap
    libjpeg
    zlib
    procps
  ];

  networking.firewall.allowedTCPPorts = [ 11100 11400 ];
  networking.firewall.allowedUDPPorts = [ 11100 11400 ];
}
