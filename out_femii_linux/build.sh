#!/bin/bash

export EBE_RELEASE=v1.6.1
export origin=$PWD

echo "Copy the bit file from the Mars_ZX3_Reference_Design_for_FEMII hardware project"
cp ../Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.runs/MarsFEMII_impl/system_top.bit fpga.bit

cd ../bsp-xilinx/
./build.sh --build-project-auto $origin/out_femii_linux.ini

echo "generate the boot.bin file, this for some reason does not work in project mode!"
cd $origin
../bsp-xilinx/bin/mkbootimage/mkbootimage boot.bif boot.bin

echo "copy the files to the correct place in the deployment folder"
cd $origin
cp rootfs.tar ../deployment/fem_boot_n_root/
cp boot.bin ../deployment/fem_boot_n_root/boot/