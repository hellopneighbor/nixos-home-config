
.PHONY: home 
.DEFAULT_GOAL := home
MAKE_USER := $(shell whoami)

build:
	sudo nixos-rebuild boot --flake .#$(HOST)

home:
	nix run home-manager -- switch --flake .#$(MAKE_USER)
