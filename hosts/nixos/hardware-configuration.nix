{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime.offload.enable = false;
  };

  services.xserver.deviceSection = ''
    Option         "MetaModes" "1920x1080 +0+0 { ForceFullCompositionPipeline = On }"
    Option         "TripleBuffer" "on"
    Option         "AllowIndirectGLXProtocol" "off"
  '';

  services.xserver.screenSection = ''
    Option         "Coolbits" "31"
  '';

  services.displayManager.sddm.wayland.enable = lib.mkForce false;

  services.lact.enable = true;

  systemd.user.services.nvidia-settings-load = {
    description = "Load NVIDIA X11 settings";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${config.hardware.nvidia.package.settings}/bin/nvidia-settings --load-config-only";
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/7c67a325-8e11-452d-915b-8707f5e7fc3f";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/92E9-FC78";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  fileSystems."/storage" = {
    device = "/dev/disk/by-uuid/ecd26839-8041-4803-9232-82b0f1287ff4";
    fsType = "ext4";
    options = [ "defaults" "nofail" "exec" ];
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
