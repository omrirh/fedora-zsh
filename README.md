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

## Fedora (VM)

`fedora-vm.yml` is the Fedora counterpart of `ubuntu-zsh.yml`, with a more
modern shell on top. Tested target: Fedora 44 VM on OpenShift Virtualization.
Run it on the VM itself:

```bash
sudo dnf install -y ansible-core git
git clone -b fedora-vm https://github.com/omrirh/fedora-zsh.git
cd fedora-zsh
ansible-playbook -K fedora-vm.yml
```

Same tags as the Ubuntu playbook:

| Tag | What |
|---|---|
| `packages` | zsh, neovim, tmux, git, git-crypt, gh, jq, yq, make, Temurin JDK 17, Maven, podman, skopeo, buildah, pipx, uv, fzf, ripgrep, fd, bat, eza, zoxide, delta, btop |
| `zsh` | oh-my-zsh + powerlevel10k, `files/fedora/.zshrc`, plugins: fzf-tab, zsh-autosuggestions, zsh-syntax-highlighting, zsh-completions, you-should-use |
| `nvim` | LazyVim |
| `cli` | oc, kubectl, rosa, gcloud, az, aws-cli v2, Node.js, Claude Code, delta as git pager |
| `repos` | git identity + `~/jenkins` and `~/rhods-qe-tools` (default branch only) |

Fonts are not installed on the VM: the prompt is rendered by your local
terminal, so install a Nerd Font (e.g. MesloLGS NF from `files/fonts/`) there.

Shell extras: `<Tab>` opens an fzf menu (with previews for `cd` and files),
Ctrl-R fuzzy-searches history, Ctrl-T inserts a file, Alt-C jumps to a
directory, `z <partial dir>` jumps to frequent directories, and `ll` / `la` /
`lt` list with eza. `ls` and `cat` are left as the standard tools.
