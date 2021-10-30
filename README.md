# Nyx

[Ansible](https://www.ansible.com/), [rcm](https://github.com/thoughtbot/rcm) and custom scripts to manage my 2 main PCs.

## How to use

Computers setup and softwares installations are processed with ansible playbooks:

```shell
ansible-playbook playbooks/setup-meushi.yml -K
ansible-playbook playbooks/setup-ringo.yml
```

User environment setup is finalized by ```my-setup.sh``` script:

* after the initial rcm setup done by this script, configuration files can be managed directly from the repository
* if necessary rcm can be manually used with ```rcup -f -v```
* see also ```my-setup.sh show-broken-symlinks``` to identify dangling symbolink link left by rcm.

## Install

1. Prepare Operating System

* for **meushi**, install [Archlinux](https://github.com/vinymeuh/Nyx/blob/master/notes/meushi-install-archlinux.md)
* for **ringo**, install [Homebrew](https://docs.brew.sh/Installation)

2. Install **pyenv** using [pyenv installer](https://github.com/pyenv/pyenv-installer)

3. Install Python

```shell
pyenv install --list
pyenv install x.x.x
pyenv versions
pyenv virtualenv x.x.x nyx
```

4. Bootstrap Nyx

```shell
git clone https://github.com/vinymeuh/Nyx.git $HOME/Nyx
cd $HOME/Nyx
pyenv activate nyx
pip install -r requirements.txt
ansible-galaxy install -r requirements.yml
```

Then see **How to use** paragraph noting that at first the script ```my-setup.sh``` is not in PATH.
