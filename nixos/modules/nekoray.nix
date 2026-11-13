{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.nekoray
  ];

  security.wrappers.nekoray = {
    owner = "root";
    group = "root";
    capabilities = "cap_net_admin,cap_net_bind_service=+ep";
    source = "${pkgs.nekoray}/bin/nekoray";
  };
}
