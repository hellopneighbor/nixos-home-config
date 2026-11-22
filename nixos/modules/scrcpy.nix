{
  pkgs,
  user,
  ...
}:

{
  environment.systemPackages = [
    pkgs.scrcpy
    pkgs.android-tools
  ];

  users.groups.adbusers = { };

  users.users.${user}.extraGroups = [ "adbusers" ];

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="18d1", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="04e8", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="2717", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="22d9", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="2a70", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="12d1", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="2d95", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="22b8", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="0fce", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="054c", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="1004", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="0bb4", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="0b05", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="17ef", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="19d2", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="0421", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="2a45", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="2916", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="1ebf", MODE="0666", GROUP="adbusers"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="0e8d", MODE="0666", GROUP="adbusers"
  '';
}
