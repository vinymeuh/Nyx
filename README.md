# Nyx

[Ansible](https://www.ansible.com/), [rcm](https://github.com/thoughtbot/rcm) and custom scripts to manage my computers.

## Install

Note that install must be do locally on each host to be configured. Most of playbooks remote execution should be ok but dotfiles are supposed to be managed locally in a clone of this repository.

1. Install **pyenv** using [pyenv installer](https://github.com/pyenv/pyenv-installer)

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

3. On macOS, install [Homebrew](https://docs.brew.sh/Installation).

## Run Ansible playbooks

```shell
ansible-playbook playbooks/<hostname>-root.yml -K
ansible-playbook playbooks/<hostname>-user.yml
```

## rcm for dotfiles

After the inital rcm setup done by the task [rcm](roles/usersetup/tasks/rcm.yml) from **usersetup** role, configuration files can be managed directly in the reposittory.

If necessary, rcm can be manually used with ```rcup -f -v```  
