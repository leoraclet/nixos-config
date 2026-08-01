default:
    @just --list

update:
    nix flake update

microvm:
    nix run .#microvm

iso:
    rm -rf result/
    nix build .#nixosConfigurations.iso.config.system.build.isoImage
    echo "Building ISO image ..."

deploy:
    echo "Deploying VPS config to remote machine ..."

clean:
    rm -rf ./result/
    rm -rf var.img
