#!/bin/bash -e

PROJECT=${PROJECT:-mrchapp}

# $1: Directory containing Dockerfile to build
build_image() {
  echo
  echo "========================================"
  echo "Now building $1..."
  echo

  image_name="build-oe-sumo_$1"
  image_from="${PROJECT}/build-base"
  if [ "$1" = "base" ]; then
    image_name="build-base"
    image_from="debian:buster"
  fi

  pushd "$1" >/dev/null
  cat <(echo "FROM ${image_from}") Dockerfile.in > Dockerfile
  popd >/dev/null

  docker build --tag="${PROJECT}/${image_name}" "$1"
}

DIRS="${*:-base arm arm64 x86}"

for d in ${DIRS}; do
  build_image "$d"
done
