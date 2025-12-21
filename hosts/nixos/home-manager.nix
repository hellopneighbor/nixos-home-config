{ config, pkgs, ... }:
let
  home-manager = builtins.fetchtarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.eugen = {
    /* the home.stateversion option does not have a default and must be set */
    home.stateversion = "25.05";
    /* here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
    dconf = {
      enable = true;
      settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };

  };
}

