#!/bin/bash -x

pushd android
find . | cpio -o -H newc | gzip > ../bootstrap/ramdisk.cpio.gz
popd

pushd recovery
find . | cpio -o -H newc | gzip > ../bootstrap/ramdisk-recovery.cpio.gz
popd

pushd bootstrap
find . | cpio -o -H newc | gzip > ../ramdisk.cpio.gz
popd

./mkbootimg --kernel kernel --ramdisk ramdisk.cpio.gz --pagesize 4096 -o normalboot.img
