{ pkgs, ... }:

{
  # Принудительный X11-режим для приложений, которые глючат в нативном Wayland
  # (чёрный экран, нет окна, тормоза и т.п.). Сам XWayland уже включён
  # через services.xserver.enable в xserver.nix.
  #
  # Использование:
  #   runx11 lutris                — Lutris в X11
  #   runx11 anyapp [аргументы]    — любое приложение в X11
  #
  # Steam: ПКМ по игре -> Свойства -> Параметры запуска:
  #   env -u WAYLAND_DISPLAY SDL_VIDEODRIVER=x11 %command%
  #
  # Lutris: конфигурация игры -> Системные параметры -> Переменные окружения:
  #   SDL_VIDEODRIVER = x11
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "runx11" ''
      # Прячем Wayland и явно выбираем X11-бэкенды у популярных тулкитов,
      # чтобы приложение гарантированно открылось через XWayland.
      exec env \
        -u WAYLAND_DISPLAY \
        -u NIXOS_OZONE_WL \
        -u ELECTRON_OZONE_PLATFORM_HINT \
        GDK_BACKEND=x11 \
        QT_QPA_PLATFORM=xcb \
        SDL_VIDEODRIVER=x11 \
        "$@"
    '')

    # Отдельный пункт в меню приложений: оригинальный Lutris остаётся как был.
    (pkgs.makeDesktopItem {
      name = "lutris-x11";
      desktopName = "Lutris (X11)";
      exec = "runx11 lutris %U";
      icon = "net.lutris.Lutris";
      categories = [ "Game" ];
    })
  ];
}
