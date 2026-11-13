{ config, pkgs, ... }:

{
  services.zapret = {
    enable = true;
    configureFirewall = true;
    udpSupport = true;
    udpPorts = [ "443" "50000:50099" ];

    blacklist = [ ];

    params = [
      "--dpi-desync=fake,split2"
      "--dpi-desync-ttl=1"
      "--dpi-desync-fooling=md5sig,badsum"
      "--dpi-desync-any-protocol=1"
    ];
  };
}
