{ pkgs, lib, stateVersion, hostname, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./local-packages.nix
      ../../nixos/modules
    ];

  boot.kernelModules = [ "kvm-amd" "tun" "bridge" "ip_tables" "iptable_filter" "iptable_nat" "iptable_mangle" "iptable_raw" "crypto_user" "xfrm_user" "chacha20poly1305" "aead" "crypto_null" ];
  boot.supportedFilesystems = [ "squashfs" ];
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  boot.kernel.sysctl."net.ipv6.conf.all.forwarding" = 1;

  powerManagement.cpuFreqGovernor = "performance";

  nixpkgs.config.allowUnfree = true;

  users.users.eugen = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "kvm" "vboxusers" "adbusers" ];
  };

  environment.systemPackages = [
    pkgs.home-manager
    pkgs.iptables
  ];

  networking.hostName = hostname;
  system.stateVersion = stateVersion;
}
