{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        input-overlay
        wlrobs
      ];
    })
  ];
}
