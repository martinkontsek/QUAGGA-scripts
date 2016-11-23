#!/bin/bash

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


clear
cecho "************************************************************************" $YELLOW
cecho "*                   QUAGGA EIGRP builder script                        *" $RED
cecho "*                                                                      *" $YELLOW
cecho "*                         Martin Kontsek                               *" $GREEN
cecho "*                              2016                                    *" $GREEN
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
./configure

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
make install


cecho "************************************************************************" $YELLOW
cecho "                       End of the script" $GREEN
cecho "************************************************************************" $YELLOW
