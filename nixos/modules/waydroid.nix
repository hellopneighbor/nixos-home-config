{
  pkgs,
  inputs,
  user,
  ...
}:

{
  nixpkgs.overlays = [ inputs.nur.overlays.default ];

  virtualisation.waydroid.enable = true;

  environment.systemPackages = [
    pkgs.wl-clipboard
    pkgs.android-tools
    pkgs.nur.repos.ataraxiasjel.waydroid-script
  ];

  systemd.services.waydroid-storage = {
    description = "Waydroid storage on /storage/ANDROID";
    wantedBy = [ "multi-user.target" "waydroid-container.service" ];
    before = [ "waydroid-container.service" "waydroid-props.service" ];
    path = [ pkgs.e2fsprogs pkgs.util-linux ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = pkgs.writeShellScript "waydroid-storage" ''
        if ! mountpoint -q /storage; then
          echo "/storage is not mounted, Waydroid will use default paths"
          exit 0
        fi

        mkdir -p /storage/ANDROID/waydroid

        IMG=/storage/ANDROID/data.img
        if [ ! -f "$IMG" ]; then
          truncate -s 100G "$IMG"
          mkfs.ext4 -q -F -L ANDROID "$IMG"
        fi

        [ -L /var/lib/waydroid ] && rm -f /var/lib/waydroid
        [ -L /home/${user}/.local/share/waydroid ] && rm -f /home/${user}/.local/share/waydroid

        mkdir -p /var/lib/waydroid /home/${user}/.local/share/waydroid/data

        mountpoint -q /var/lib/waydroid || mount --bind /storage/ANDROID/waydroid /var/lib/waydroid
        mountpoint -q /home/${user}/.local/share/waydroid/data || mount "$IMG" /home/${user}/.local/share/waydroid/data

        chown ${user}: /home/${user}/.local/share/waydroid /home/${user}/.local/share/waydroid/data
      '';
    };
  };

  systemd.services.waydroid-props = {
    description = "Waydroid NVIDIA and gaming properties";
    wantedBy = [ "waydroid-container.service" ];
    before = [ "waydroid-container.service" ];
    after = [ "waydroid-storage.service" ];
    path = [ pkgs.python3 ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = pkgs.writeShellScript "waydroid-props" ''
        python3 - <<'EOF'
        import configparser
        import os

        work = "/var/lib/waydroid"

        props = {
            "ro.hardware.gralloc": "default",
            "ro.hardware.egl": "swiftshader",
            "persist.waydroid.cursor_on_subsurface": "true",
        }

        cfg_path = os.path.join(work, "waydroid.cfg")
        if os.path.isfile(cfg_path):
            cfg = configparser.RawConfigParser()
            cfg.optionxform = str
            cfg.read(cfg_path, encoding="utf-8")
            if not cfg.has_section("properties"):
                cfg.add_section("properties")
            for key, value in props.items():
                cfg.set("properties", key, value)
            with open(cfg_path, "w", encoding="utf-8") as f:
                cfg.write(f)

        base_path = os.path.join(work, "waydroid_base.prop")
        if os.path.isfile(base_path):
            with open(base_path, encoding="utf-8") as f:
                lines = f.read().splitlines()
            for key, value in props.items():
                lines = [line for line in lines if not line.startswith(key + "=")]
                lines.append(key + "=" + value)
            with open(base_path, "w", encoding="utf-8") as f:
                f.write("\n".join(lines) + "\n")
        EOF
      '';
    };
  };
}
