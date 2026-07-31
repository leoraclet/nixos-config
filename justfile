default:
    @just --list

build-iso:
    echo "Building ISO image ..."

deploy-vps:
    echo "Deploying VPS config to remote machine ..."

clean:
    rm -rf ./result/
