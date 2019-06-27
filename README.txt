To build, just run:
  ./build.sh

Optionally, to only build one of the images do, e.g.:
  ./build.sh arm64

The base project can be changed by setting PROJECT, e.g.:
  PROJECT=kernelci-fork ./build.sh x86
which will, instead of:
  mrchapp/build-oe-sumo_x86
tag the image like this:
  kernelci-fork/build-oe-sumo_x86
