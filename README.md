# Nyx

My shell environment with Bash 4 and Nixpkgs under macOS.

## Install

```
~> cd $HOME/Library
~> git clone https://github.com/vinymeuh/nyx.git nyx
~> ln -s $HOME/Library/nyx $HOME/.nyx
~> $HOME/.nyx/bin/nyx-env setup
```

## Python setup

Python interpreters are wrappers installed under ```$NYX_HOME/bin``` which hides the ones installed by Nix.

Pip must be installed manually with default Python interpreter under user site-packages directory

```
~> wget https://bootstrap.pypa.io/get-pip.py
~> python get-pip.py --user
```

An then Install **virtualenvwrapper**  under user site-packages directory:

```
~> pip install --user virtualenvwrapper
```

See ```bashrc``` for initializing virtualenvwrapper and setting the WORKON environment variable.

**Note**: all of this is necessary because I can not use the virtualenvwrapper from nix because of [issue 30586](https://github.com/NixOS/nixpkgs/issues/30586)
