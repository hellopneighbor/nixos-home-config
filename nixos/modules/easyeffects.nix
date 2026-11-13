{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    easyeffects
    pavucontrol
    lsp-plugins
    calf
    rubberband
  ];

  security.rtkit.enable = true;
}
