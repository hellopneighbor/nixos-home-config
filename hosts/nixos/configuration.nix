# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, lib, stateVersion, hostname, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./local-packages.nix
      ../../nixos/modules
    ];

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_12;
  boot.kernelModules = [ "kvm-amd" "tun" "bridge" "ip_tables" "iptable_filter" "iptable_nat" "iptable_mangle" "iptable_raw" ];
  boot.supportedFilesystems = [ "squashfs" ];

  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  boot.kernel.sysctl."net.ipv6.conf.all.forwarding" = 1;

  powerManagement.cpuFreqGovernor = "performance";

  networking.firewall.enable = false;
  networking.nat.enable = false;

  users.users.eugen = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "kvm" ];
  };

  environment.systemPackages = [ pkgs.home-manager pkgs.iptables ];

  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}
