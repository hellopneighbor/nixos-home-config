{ config, lib, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      corefonts
      dejavu_fonts
      fira
      fira-mono
      line-awesome
      google-fonts
      inconsolata
      libertine
      mononoki
      nerd-fonts._0xproto
      nerd-fonts.droid-sans-mono
      open-dyslexic
      overpass
      oxygenfonts
      powerline-fonts
      source-code-pro
      source-sans-pro
      source-serif-pro
      ttf_bitstream_vera
      ubuntu-classic
      unifont
      monocraft
    ];
    fontconfig = {
      antialias = true;
      cache32Bit = true;
      hinting.enable = true;
      hinting.autohint = true;
      defaultFonts = {
        monospace = [ "Monocraft" ];
        sansSerif = [ "Monocraft" ];
        serif = [ "Source Serif Pro" ];
      };
    };
  };
}
