{ homeStateVersion, user, lazyvim, ... }: {
  imports = [
    ./modules
    ./home-packages.nix
  ];

  home = {
    username = "eugen";
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };
  programs.home-manager.enable = true;
}
