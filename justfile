default:
    @just --list

debug:
    nixos-rebuild switch --flake .#leonne --use-remote-sudo --show-trace --verbose

update:
    nix flake update

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
