{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
    home = "/storage/.ollama";
  };
}
