#!/bin/bash
#
# fixEclipsePermission.sh
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
# Fix Eclipse and source directory and files ownership
# after using Eclipse as root
# 

sudo chown -R $USER:$USER $HOME/workspace
sudo chown -R $USER:$USER $HOME/eclipse
sudo chown -R $USER:$USER $HOME/git/Quagga-EIGRP
