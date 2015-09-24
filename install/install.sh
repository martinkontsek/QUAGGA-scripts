#!/bin/bash

HOME_PATH="/home/$USER"
GIT_PATH="$HOME_PATH/git"
DESKTOP_PATH="$HOME_PATH/Desktop"

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
cecho "*             QUAGGA EIGRP development install script                  *" $RED
cecho "*                                                                      *" $YELLOW
cecho "*                         Martin Kontsek                               *" $GREEN
cecho "************************************************************************" $YELLOW
echo
echo

echo
echo "************************************************************************"
echo "Install required packages for Quagga development"
sudo apt-get install gcc git automake autoconf libtool dia texinfo gawk dynamips dynagen

echo
echo "************************************************************************"
echo "Add required user quagga, as password use quagga."
sudo adduser quagga

echo
echo "************************************************************************"
echo "Copy sctipts to their location."
cp ../build/build.sh $GIT_PATH/ 
cp ../run/rightsVarRun.sh $GIT_PATH/ 
cp ../run/runTerm.sh $GIT_PATH/ 
cp ../run/cpQuaggaConf.sh $GIT_PATH/ 


echo
echo "************************************************************************"
echo "Generate Desktop launcher."
echo "[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=xfce4-terminal -e  /home/$USER/git/runTerm.sh
Name=Quagga" > $DESKTOP_PATH/quagga.desktop

chmod a+x $DESKTOP_PATH/quagga.desktop


echo
echo "************************************************************************"
echo "Download Eclipse Mars x64."
wget http://ftp.heanet.ie/pub/eclipse//technology/epp/downloads/release/mars/R/eclipse-cpp-mars-R-linux-gtk-x86_64.tar.gz


echo
echo "************************************************************************"
echo "Unpack and install Eclipse."
tar -zxvf eclipse-cpp-mars-R-linux-gtk-x86_64.tar.gz
rm eclipse-cpp-mars-R-linux-gtk-x86_64.tar.gz
mv eclipse $HOME_PATH/eclipse/
