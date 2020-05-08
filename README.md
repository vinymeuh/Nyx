# nyx

[Ansible](https://www.ansible.com/), [rcm](https://github.com/thoughtbot/rcm) and custom scripts to manage my computers.

## ansible for systems setup

Ensure Python 3 is installed on master computer then:

```shell
git clone git@github.com:vinymeuh/nyx-ng.git $HOME/Nyx
cd $HOME/Nyx/ansible
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

For each target hosts, ensure Python 3 is installed and copy SSH key from master computer:

```shell
ssh-copy-id -i ~./ssh/id_viny.pub user@host
```

## rcm for dotfiles

Dotfiles are not pushed from master host but must be install individually on each hosts:

```shell
git clone git@github.com:vinymeuh/nyx-ng.git $HOME/Nyx
cd $HOME/Nyx/dotfiles
./setup.sh
```
