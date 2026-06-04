
.PHONY: home 
.DEFAULT_GOAL := home
MAKE_USER := $(shell whoami)
MY_HOST := $(shell hostnmame)

build:
	sudo nixos-rebuild switch --flake .#$(MY_HOST)

home:
	nix run home-manager -- switch --flake .#$(MAKE_USER)

link:
	ln -sf $(shell pwd)/home-manager/home-packages.nix	~/Desktop/packages.nix
