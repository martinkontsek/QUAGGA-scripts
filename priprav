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

cecho ()                     # Color-echo.
                             # Argument $1 = message
                             # Argument $2 = color
{
local default_msg="No message passed."
                             # Doesn't really need to be a local variable.

message=${1:-$default_msg}   # Defaults to default message.
color=${2:-$BLACK}           # Defaults to black, if not specified.

  echo -e "$color$message$RESET"
  
  return
}  


clear
cecho "************************************************************************" $YELLOW
cecho "*                   QUAGGA EIGRP builder script                        *" $RED
cecho "*                                                                      *" $YELLOW
cecho "*                         Martin Kontsek                               *" $GREEN
cecho "************************************************************************" $YELLOW
echo
echo

cecho "************************************************" $YELLOW
cecho " Vymazanie a znova nakopirovanie zlozky build" $RED
cecho "************************************************" $YELLOW
echo -e "$GREEN"
read -p "  Stlacte klavesu pre pokracovanie."
echo -e "$RESET"
rm -r build
mkdir build
cp -r Quagga-EIGRP/* build/

cecho "************************************************" $YELLOW
cecho " Spustenie bootstrap.sh" $RED
cecho "************************************************" $YELLOW
echo -e "$GREEN"
read -p "  Stlacte klavesu pre pokracovanie."
echo -e "$RESET"
cd build
./bootstrap.sh

cecho "************************************************" $YELLOW
cecho " Konfiguracia" $RED
cecho "************************************************" $YELLOW
echo -e "$GREEN"
read -p "  Stlacte klavesu pre pokracovanie."
echo -e "$RESET"
./configure

cecho "************************************************" $YELLOW
cecho " Make" $RED
cecho "************************************************" $YELLOW
echo -e "$GREEN"
read -p "  Stlacte klavesu pre pokracovanie."
echo -e "$RESET"
make -j4

cecho "************************************************" $YELLOW
cecho " Instalacia" $RED
cecho "************************************************" $YELLOW
echo -e "$GREEN"
read -p "  Stlacte klavesu pre pokracovanie."
echo -e "$RESET"
make install


cecho "************************************************************************" $YELLOW
cecho "                     Koniec scriptu" $GREEN
cecho "************************************************************************" $YELLOW
