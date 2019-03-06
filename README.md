# Nyx

Ansible playbooks and scripts to setup my shell environment.

Current setup is only tested and used under macOS with [MacPorts](https://www.macports.org/).

## Bootstrap

First manually install [MacPorts](https://www.macports.org/install.php) then:

```shell
~> cd $HOME/Library
~> git clone https://github.com/vinymeuh/nyx.git
~> cd nyx
~> ./bootstrap.sh
```

## Ansible Playbooks

Activate the Python virtualenv created for Ansible: ```~> source $HOME/Library/nyx/venv/bin/activate```

Run the full playbook with: ```~> ansible-playbook nyx-setup.yml -K```

It is possible to run a restricted set of roles using following tags:

* macports, webserver (both need the sudo password)
* bash, git, backup (without password)
