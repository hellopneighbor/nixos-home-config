{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "~/nixos";
      in {
        sw = "nh os switch";
        upd = "nh os switch --update";
        hms = "NH_HOME_FLAKE=/home/eugen/nixos nh home switch";

        pkgs = "nvim ${flakeDir}/nixos/packages.nix";

        v = "vim";
        se = "sudoedit";
        microfetch = "microfetch && echo";

        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gp = "git push";

        ".." = "cd ..";
        nvme = "cd /storage";
        hame = "cd ~/nixos  && make home";
        bild = "cd ~/nixos && make build";
        lol = "cd ~/home";
      };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/.zsh_history";

    initContent = ''
      export XDG_DATA_DIRS="$XDG_DATA_DIRS:/storage/flatpak/exports/share"

      source ~/.nix-profile/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      if [ -z "$TMUX" ] && [ -n "$DISPLAY" ]; then
        tmux attach-session -t default || tmux new-session -s default
      fi

      if uwsm check may-start > /dev/null && uwsm select; then
        exec systemd-cat -t uwsm_start uwsm start default
      fi

      if [[ -n "$TMUX" ]]; then
        fastfetch
        echo ""
      fi
    '';
  };
}
