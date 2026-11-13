{ pkgs, lazyvim, ... }: {
  imports = [ lazyvim.homeManagerModules.default ];

  programs.lazyvim = {
    enable = true;

    extras = {
      lang.nix.enable = true;
    };

    extraPackages = with pkgs; [
      nixd       # Nix LSP
      alejandra  # Nix formatter
    ];
  };
}
