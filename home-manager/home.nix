{ homeStateVersion, user, ... }: {
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
