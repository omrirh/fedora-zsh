## fedora zsh
### Setup a local environment with zsh, openshift tools and other cool plugins.

## Image includes:
Via pip: 
  - tox
  - ipdb
  - docker
  - pipenv
  - poetry
  - ipython
  - pre-commit
  - black
  - isort

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
Clone the repository:
```bash
git clone https://github.com/RedHatQE/fedora-zsh.git
cd fedora-zsh
```
Create Fedora zsh environment with Ansible
```bash
ansible-playbook -K fedora-zsh.yml
```