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

## Ubuntu

`ubuntu-zsh.yml` is the Debian/Ubuntu counterpart, extended with the RHOAI QE
dev toolchain. Tested target: Ubuntu 24.04 (GCE image).

```bash
sudo apt update && sudo apt install -y ansible git
git clone https://github.com/omrirh/fedora-zsh.git
cd fedora-zsh
ansible-galaxy collection install community.general
ansible-playbook -K ubuntu-zsh.yml
```

Installs, on top of the zsh/p10k/LazyVim setup:

| Tag | What |
|---|---|
| `packages` | git, git-crypt, jq, make, OpenJDK 17, Maven, podman, skopeo, buildah, ansible, pipx |
| `cli` | oc, kubectl, rosa, yq, uv, gcloud, az, aws-cli v2, Node.js, Claude Code |
| `repos` | git identity + `~/jenkins` and `~/rhods-qe-tools` (default branch only) |

Run a subset with `--tags` / `--skip-tags`. `repos` is skipped automatically
when `~/.ssh` has no key; add one registered on GitLab and rerun `--tags repos`.

Credentials: `.zshrc` declares the required variables with empty values and
sources `~/.env` if present. Put real values there (`chmod 600 ~/.env`), never
in `.zshrc`.
