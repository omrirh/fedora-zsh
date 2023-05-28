## Fedora ZSH
### Setup a local environment with zsh, openshift tools and other swagger plugins.

## Image includes:
Via pip: 
  - tox
  - ipdb
  - docker
  - pipenv
  - poetry
  - ipython
  - pre-commit

Via dnf:
  - oc
  - zsh
  - git
  - vim
  - wget
  - awscli
  - ocm-cli
- [bash-insulter](https://github.com/hkbakke/bash-insulter) :)
- [kubectl](https://kubernetes.io/docs/reference/kubectl/)
- [rosa](https://docs.openshift.com/rosa/rosa_cli/rosa-get-started-cli.html)

## Requirements
[ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html): install using package manager

## Installation
Clone the repository and install Ansible:
```bash
git clone https://github.com/omrirh/fedora-zsh.git
cd fedora-zsh
sudo dnf update
sudo dnf install ansible
```
Create Fedora zsh environment with Ansible
```bash
ansible-playbook fedora-zsh.yml --extra-vars "home=<user home dir> user=<user name>"
```