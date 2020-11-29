# Nyx

[Ansible](https://www.ansible.com/), [rcm](https://github.com/thoughtbot/rcm) and custom scripts to manage my computers.

## Ansible for systems setup

### Install on controller host

1. Install using [pyenv installer](https://github.com/pyenv/pyenv-installer)

List Python avaibable versions for install with ```pyenv install --list```.

```shell
pyenv install x.x.x
pyenv virtualenv x.x.x nyx
```

2. Bootstrap Nyx

```shell
git clone https://github.com/vinymeuh/Nyx.git $HOME/Nyx
cd $HOME/Nyx
pyenv activate nyx
pip install -r requirements.txt
```

3. For each target hosts, ensure Python 3 is installed and copy SSH key from master computer:

```shell
ssh-copy-id -i ~./ssh/id_viny.pub user@host
```

### Run playbooks

```shell
ansible-playbook playbooks/<hostname>-root.yml -K
ansible-playbook playbooks/<hostname>-user.yml
```

## rcm for dotfiles

Dotfiles are not pushed from master host but must be install individually on each hosts:

```shell
git clone https://github.com/vinymeuh/Nyx.git $HOME/Nyx
cd $HOME/Nyx/dotfiles
./setup.sh
```
