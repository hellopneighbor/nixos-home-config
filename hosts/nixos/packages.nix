{ config, pkgs, ... }:

{
  users.users.eugen = {
    isNormalUser = true;
    description = "eugen";
    initialPassword="q1w2e3r4";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      blender
      telegram-desktop
      obs-studio
    ];
  };
}
