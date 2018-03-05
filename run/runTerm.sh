#!/bin/bash
sudo xfce4-terminal -T "tcpdump" --working-directory=$HOME/git \
  --tab -T "build" --working-directory=$HOME/git \
  --tab -T "dynamips" --working-directory=$HOME/Dynagen -H -e "dynamips -H 31001 &" \
  --tab -T "dynagen" --working-directory=$HOME/Dynagen \
  --tab -T "zebra" --working-directory=$HOME/git \
  --tab -T "eigrpd" --working-directory=$HOME/git\
  --tab -T "telnet eigrp" --working-directory=$HOME \
  --tab -T "telnet zebra" --working-directory=$HOME \
  --tab -T "telnet router" --working-directory=$HOME \
  --tab -T "thunar" --working-directory=$HOME/git -H -e "thunar" \
  --tab -T "eclipse" --working-directory=$HOME/eclipse -H -e "./eclipse"
