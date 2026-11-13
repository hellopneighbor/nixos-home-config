{ config, pkgs, ... }:

{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
  };

  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };
}
