{ lib, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 1.0;

      font = {
        builtin_box_drawing = false;
        normal = {
          style = lib.mkForce "Bold";
        };
      };
    };
  };
}
