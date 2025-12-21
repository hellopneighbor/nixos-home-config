{ bootdevice, mountpoint, ... }: {
  boot.loader = {
    efi = {
      canTouchEfiVariables = false;
      efiSysMountPoint = mountpoint;
    };
    grub = {
       enable = true;
       efiSupport = true;
       efiInstallAsRemovable = true;
       device = bootdevice;
       useOSProber = true;
    };
  };
}
