{
  # boot.loader.systemd-boot.enable = true;

  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  boot.loader.efi.canTouchEfiVariables = true;
}
