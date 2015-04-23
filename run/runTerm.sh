#!/bin/bash
sudo xfce4-terminal -T "rights" \
  --working-directory=/home/martin/git -H -e "./rightsVarRun.sh" \
  --tab -T "build" --working-directory=/home/martin/git \
  --tab -T "dynamips" --working-directory=/home/martin/Dynagen -H -e "dynamips -H 31001 &" \
  --tab -T "dynagen" --working-directory=/home/martin/Dynagen -H -e "./skript3" \
  --tab -T "zebra" --working-directory=/home/martin/git \
  --tab -T "eigrpd" --working-directory=/home/martin/git\
  --tab -T "telnet eigrp" --working-directory=/home/martin \
  --tab -T "telnet zebra" --working-directory=/home/martin \
  --tab -T "telnet router" --working-directory=/home/martin \
  --tab -T "thunar" --working-directory=/home/martin/git -H -e "thunar" \
  --tab -T "eclipse" --working-directory=/home/martin/eclipse -H -e "./eclipse"    
