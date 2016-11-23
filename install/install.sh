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

cecho () {
  local default_msg="No message passed."

  message=${1:-$default_msg}  
  color=${2:-$BLACK}      

  echo -e "$color$message$RESET"  
  return
}  


clear
cecho "************************************************************************" $YELLOW
cecho "*             QUAGGA EIGRP development install script                  *" $RED
cecho "*                                                                      *" $YELLOW
cecho "*                         Martin Kontsek                               *" $GREEN
cecho "*                             2016                                     *" $GREEN
cecho "************************************************************************" $YELLOW
echo
echo

echo
echo "************************************************************************"
echo "Install required packages for Quagga development"
sudo apt-get install gcc git automake autoconf libtool dia texinfo gawk dynamips dynagen

echo
echo "************************************************************************"
echo "Add required user quagga."
sudo adduser --no-create-home --disabled-password --disabled-login --gecos "" quagga

echo
echo "************************************************************************"
echo "Copy scripts to their location."
mkdir -pv $GIT_PATH
cp -v ../build/build.sh $GIT_PATH/ 
cp -v ../run/rightsVarRun.sh $GIT_PATH/ 
cp -v ../run/runTerm.sh $GIT_PATH/ 
cp -v ../run/cpQuaggaConf.sh $GIT_PATH/ 


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
echo "Download Eclipse Neon x64."
wget http://mirror.cc.columbia.edu/pub/software/eclipse/technology/epp/downloads/release/neon/1a/eclipse-cpp-neon-1a-linux-gtk-x86_64.tar.gz

echo
echo "************************************************************************"
echo "Unpack and install Eclipse."
tar -xf eclipse-cpp-*.tar.gz
rm -fv eclipse-cpp-*.tar.gz
mv -v eclipse $HOME_PATH/
