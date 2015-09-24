#!/bin/bash
sudo xfce4-terminal -T "rights" \
  --working-directory=/home/$USER/git -H -e "./rightsVarRun.sh" \
  --tab -T "build" --working-directory=/home/$USER/git \
  --tab -T "dynamips" --working-directory=/home/$USER/Dynagen -H -e "dynamips -H 31001 &" \
  --tab -T "dynagen" --working-directory=/home/$USER/Dynagen -H -e "./skript3" \
  --tab -T "zebra" --working-directory=/home/$USER/git \
  --tab -T "eigrpd" --working-directory=/home/$USER/git\
  --tab -T "telnet eigrp" --working-directory=/home/$USER \
  --tab -T "telnet zebra" --working-directory=/home/$USER \
  --tab -T "telnet router" --working-directory=/home/$USER \
  --tab -T "thunar" --working-directory=/home/$USER/git -H -e "thunar" \
  --tab -T "eclipse" --working-directory=/home/$USER/eclipse -H -e "./eclipse"    
