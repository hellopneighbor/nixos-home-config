{ config, pkgs, ... }: {

  programs.uwsm.enable = true;

  environment.systemPackages = [ pkgs.uwsm ];
}
