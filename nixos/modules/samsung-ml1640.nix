{ pkgs, ... }:

{
  # Включение службы печати CUPS
  services.printing = {
    enable = true;
    drivers = [ pkgs.splix pkgs.gutenprint ]; # Сразу оба драйвера (текст + графика)
  };
}
