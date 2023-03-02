#!/usr/bin/env bash
set -eu
IMAGES_DIR="images"
BASE_IMAGE="julia:1.8-bullseye"
APP_NAME="app"

base() {
    mkdir -p "$IMAGES_DIR"
    apptainer build "$IMAGES_DIR/julia.sif" "docker://$BASE_IMAGE"
}

build() {
    mkdir -p "$IMAGES_DIR"
    apptainer build "$IMAGES_DIR/$APP_NAME.sif" Apptainer
}

run() {
    apptainer run "$IMAGES_DIR/$APP_NAME.sif" "$@"
}

# Pass arguments to the script
case $1 in
    (base)
        base
        ;;
    (build)
        build
        ;;
    (run)
        shift
        run "$@"
        ;;
    (*) exit 1
esac
