# Nyx

Ansible playbook to setup my computer.

## Prerequisites

### Install Ansible

Assuming a Python interpreter is already installed:

```
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt  
```

### MacPorts

Manually install [MacPorts](https://www.macports.org/install.php).

## Playbooks

```
~> source $HOME/Library/nyx/venv/bin/activate```
```

Install MacPorts ports requires sudo password: ```~> ansible-playbook ringo.yml -t macports -K```

For all others tasks, simply do a ```ansible-playbook ringo.yml```
