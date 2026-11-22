{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    # Свежий Proton-GE: у него новее рантайм Easy Anti-Cheat.
    # Выбирается: ПКМ по игре -> Свойства -> Совместимость -> GE-Proton
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  # Gamescope — вложенный композитор для игр: лечит чёрные экраны и капризы
  # полноэкранного режима на NVIDIA (запуск из Steam:
  # gamescope -f -w 1920 -h 1080 -- %command%).
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };
}
