default:
    @just --list

build-iso:
    echo "Building ISO image ..."

deploy:
    echo "Deploying config to remote ..."

clean:
    rm -rf ./result/
