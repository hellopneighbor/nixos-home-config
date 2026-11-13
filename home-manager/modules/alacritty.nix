{ lib, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 1.0;

      font = {
        builtin_box_drawing = false;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = lib.mkForce "Bold";
        };
      };
    };
  };
}
