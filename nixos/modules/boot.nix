{ bootdevice, mountpoint, ... }: {
  boot.loader = {
    # efi = {
    #   canTouchEfiVariables = false;
    #   efiSysMountPoint = mountpoint;
    # };
    grub = {
       enable = true;
       device = bootdevice;
       # efiSupport = true;
       # efiInstallAsRemovable = true;
       # device = bootdevice;
       # useOSProber = true;
    };
  };
}
