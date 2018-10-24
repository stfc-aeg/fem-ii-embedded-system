#!/bin/sh
#Run the Odin Server with the QEM Adapter
cd  qem-detector/control/fem-adapter
odin_server --config config/qem.cfg
