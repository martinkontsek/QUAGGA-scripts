#!/bin/bash
#
# build.sh
# Copyright (c) 2016
#
# Author:
#   Martin Kontsek
#
# This file is part of QUAGGA-scripts
#
# QUAGGA-scripts is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2, or (at your option) any
# later version.
#
# QUAGGA-scripts is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
#
# Quagga builder script
#

# Colors
ESC_SEQ="\x1b["
RESET=$ESC_SEQ"39;49;00m"
RED=$ESC_SEQ"31;01m"
GREEN=$ESC_SEQ"32;01m"
YELLOW=$ESC_SEQ"33;01m"
BLUE=$ESC_SEQ"34;01m"
MAGENTA=$ESC_SEQ"35;01m"
CYAN=$ESC_SEQ"36;01m"

cecho ()
{
  local default_msg="No message passed."

  message=${1:-$default_msg}
  color=${2:-$BLACK}

  echo -e "$color$message$RESET"

  return
}

# Where to store Quagga runtime files
QUAGGA_RUN_PREFIX=/var/quagga

clear
cecho "************************************************************************" $YELLOW
cecho "*                   QUAGGA EIGRP builder script                        *" $RED
cecho "*                                                                      *" $YELLOW
cecho "*                         Martin Kontsek                               *" $GREEN
cecho "*                              2018                                    *" $GREEN
cecho "************************************************************************" $YELLOW
echo
echo

cecho "************************************************" $YELLOW
cecho " Cleanup and copy Quagga to new folder 'build'" $RED
cecho "************************************************" $YELLOW
echo -e "$GREEN"
read -p "  Press key to continue..."
echo -e "$RESET"
rm -rf build
mkdir build
cp -r Quagga-EIGRP/* build/

cecho "************************************************" $YELLOW
cecho " Launch bootstrap.sh" $RED
cecho "************************************************" $YELLOW
echo -e "$GREEN"
read -p "  Press key to continue..."
echo -e "$RESET"
cd build
./bootstrap.sh

cecho "************************************************" $YELLOW
cecho " Configure" $RED
cecho "************************************************" $YELLOW
echo -e "$GREEN"
read -p "  Press key to continue..."
echo -e "$RESET"
./configure --localstatedir=$QUAGGA_RUN_PREFIX

cecho "************************************************" $YELLOW
cecho " Make" $RED
cecho "************************************************" $YELLOW
echo -e "$GREEN"
read -p "  Press key to continue..."
echo -e "$RESET"
make -j8

cecho "************************************************" $YELLOW
cecho " Install" $RED
cecho "************************************************" $YELLOW
echo -e "$GREEN"
read -p "  Press key to continue..."
echo -e "$RESET"
sudo make install
sudo ldconfig

cecho "************************************************" $YELLOW
cecho " Creating quagga runtime directory" $RED
cecho "     and setting proper owner" $RED
cecho "************************************************" $YELLOW
sudo mkdir -p $QUAGGA_RUN_PREFIX
sudo chown -R quagga:quagga $QUAGGA_RUN_PREFIX


cecho "************************************************************************" $YELLOW
cecho "                       End of the script" $GREEN
cecho "************************************************************************" $YELLOW
