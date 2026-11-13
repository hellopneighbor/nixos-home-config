{ pkgs, ... }:

{
  services.flatpak.enable = true;

  environment.etc."flatpak/installations.d/nvme.conf".text = ''
    [Installation "nvme"]
    Path=/storage/flatpak/
    DisplayName=NVMe Drive
    StorageType=harddisk
  '';

  environment.sessionVariables = {
    XDG_DATA_DIRS = [ "/storage/flatpak/exports/share" ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
    config.common.default = "kde";
  };
}
