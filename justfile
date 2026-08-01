username := `whoami`
hostname := `hostname -s`
system := `nix-instantiate --raw --strict --eval -E builtins.currentSystem`

default:
    @echo "System   : {{ system }}"
    @echo "Hostname : {{ hostname }}"
    @echo "Username : {{ username }}"
    @echo

    @just --list

show:
    nix flake show --no-write-lock-file

debug:
    nixos-rebuild switch --flake .#leonne --use-remote-sudo --show-trace --verbose

format:
    alejandra .

update:
    nix flake update

update-input:
    nix run .#update-input

history:
    nix profile history --profile /nix/var/nix/profiles/system

repl:
    nix repl -f flake:nixpkgs

microvm:
    nix run .#microvm

iso:
    rm -rf result/
    nix build .#nixosConfigurations.iso.config.system.build.isoImage

deploy:
    echo "Deploying VPS config to remote machine ..."

wipe:
    # remove all generations older than 7 days
    sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
    # garbage collect all unused nix store entries
    sudo nix-collect-garbage --delete-old

clean:
    rm -rf ./result/
    rm -rf var.img
