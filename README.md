# Nyx

[Ansible](https://www.ansible.com/), [rcm](https://github.com/thoughtbot/rcm) and custom scripts to manage my computers.

## ansible for systems setup

Ensure Python 3 is installed on master computer then:

```shell
git clone https://github.com/vinymeuh/Nyx.git $HOME/Nyx
cd $HOME/Nyx
python -m venv venv
source venv/bin/activate.fish
pip install -r requirements.txt
```

For each target hosts, ensure Python 3 is installed and copy SSH key from master computer:

```shell
ssh-copy-id -i ~./ssh/id_viny.pub user@host
```

All playbooks require the password for sudo:

```shell
ansible-playbook playbooks/<hostname>-root.yml -K
ansible-playbook <hostname>-user.yml
```

## rcm for dotfiles

Dotfiles are not pushed from master host but must be install individually on each hosts:

```shell
git clone https://github.com/vinymeuh/Nyx.git $HOME/Nyx
cd $HOME/Nyx/dotfiles
./setup.sh
```
