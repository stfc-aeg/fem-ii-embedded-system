# fem-ii-embedded-system
This repository contains the elements to generate an embedded system for the FEM-II module.

This repository includes the following projects / directories:

1 - Vivado hardware design for the Enclustra module based on a reference design from Enclusta "Mars_ZX3_Reference_Design_for_FEMII"

2 - The Enclustra build environment "bsp-xilinx" is added as a sub-module (see the readme or website for further information)

3 - A reference design for the V7 on the FEM-II module "Femii-Reference_Design" providing chip-to-chip and basic registers.

use the following commands

1 - clone the repository and submodules

git clone git@github.com:stfc-aeg/fem-ii-embedded-system.git
git submodule init
git submodule update

2 - build the FEM-II hardware design for the Enclustra module with Xilinx Vivado tools (Mars_ZX3_Reference_Design_for_FEM-II)

3 - Export the design to SDK, create the Device tree and FSBL files

4 - Read the enclustra documentation and decide on you preferred configuration method (SD, QSPI, NAND, TFTP) and build the RFS, KERNEL etc

5 - subsitute the bit, FSBL and device tree files for the ones generated in step 2

6 - genarate the bin configuration file

7 - load onto configuration medium

8 - build the V7 reference design, load the configuration bitstream onto FPGA and or configuration FLASH

9 - power off / on the FEM. plug a USB cable into front and see the enclustra boot 115200 baud

10 - login with root, password root and change password

11 - setup network configuration, DHCP, static etc

