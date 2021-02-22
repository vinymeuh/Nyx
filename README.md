# Nyx

[Ansible](https://www.ansible.com/), [rcm](https://github.com/thoughtbot/rcm) and custom scripts to manage my 2 main PCs.

## How to use

```shell
ansible-playbook playbooks/<hostname>-root.yml -K
ansible-playbook playbooks/<hostname>-user.yml
```

After the inital rcm setup done by the task [rcm](roles/usersetup/tasks/rcm.yml) from **usersetup** role, configuration files can be managed directly in the repository. If necessary rcm can be manually used with

```shell
rcup -f -v
```

## Install

1. Prepare Operating System

* for **meushi**, install [Archlinux](https://github.com/vinymeuh/Nyx/blob/master/notes/meushi-install-archlinux.md)
* for **ringo**, install [Homebrew](https://docs.brew.sh/Installation)

2. Install **pyenv** using [pyenv installer](https://github.com/pyenv/pyenv-installer)

3. Install Python

```shell
pyenv install --list
pyenv install x.x.x
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
