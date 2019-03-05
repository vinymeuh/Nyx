#!/usr/bin/env bash

#. I'm a mac ?
if [ $(uname) != "Darwin" ]; then
    echo "This script has been designed for macOS"
    exit 1
fi

#. Force to be install in $HOME/Library/nyx 
if [ $(pwd) != "$HOME/Library/nyx" ]; then
    echo "This script must be launched from $HOME/Library/nyx"
    exit 1
fi

#. Checks MacPorts installation
if [ ! -x /opt/local/bin/port ]; then
    echo "Please first install MacPorts"
    open https://www.macports.org/install.php
    exit 1
fi
export PATH=/opt/local/bin:$PATH

#. Install Python 3.7
sudo port install python3_select python37
sudo port select --set python3 python37
sudo port select --set python python37

#. Create venv
python -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install ansible
pip list
deactivate
