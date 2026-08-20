{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    open=false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime.offload.enable=false;
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/7c67a325-8e11-452d-915b-8707f5e7fc3f";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/92E9-FC78";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  fileSystems."/STORAGE" =
    { device = "/dev/disk/by-uuid/e8f44eec-8d73-4236-84c9-442508babaf1";
      fsType = "ext4";
      options = [ "users" "nofail" "x-systemd.automount" "x-systemd.device-timeout=5s" ];
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
