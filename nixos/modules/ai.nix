{ config, pkgs, ... }:

{
  # Virtual keyboard/mouse daemon for the AI game agent (works on Wayland).
  # Defined explicitly instead of using the nixpkgs module, because the module
  # was renamed across versions (services.ydotool -> programs.ydotool) and we
  # don't want to depend on which name the installed nixpkgs has.
  # Socket: /run/ydotoold/socket, owned root:ydotool, mode 0660.
  # (Ollama itself lives in ollama.nix.)
  users.groups.ydotool = { };

  systemd.services.ydotoold = {
    description = "ydotoold - virtual input daemon (AI game agent)";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.ydotool}/bin/ydotoold --socket-path=/run/ydotoold/socket --socket-perm=0660";
      Group = "ydotool";
      RuntimeDirectory = "ydotoold";
      RuntimeDirectoryMode = "0755";
      RestrictAddressFamilies = [ "AF_UNIX" ];
      DeviceAllow = [ "/dev/uinput" ];
      DevicePolicy = "closed";
      NoNewPrivileges = true;
    };
  };

  environment.variables.YDOTOOL_SOCKET = "/run/ydotoold/socket";
  environment.systemPackages = [ pkgs.ydotool ];

  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };
}
