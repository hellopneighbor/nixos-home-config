{
  # services.xserver.enable = true;
  # services.xserver.desktopManager.gnome.enable=true;
  # services.xserver.displayManager.sddm.enable=true;
  # services.xserver.displayManager.sddm.wayland.enable = true;
  services.xserver.enable = true; # optional
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
}

