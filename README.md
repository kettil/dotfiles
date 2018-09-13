# Dotfiles 🎃

My dotfiles library

## 🎯 Install

```
git clone https://github.com/kettil/dotfiles ~/.dotfiles

cd ~/.dotfiles && ./setup.sh install
```

The font of the terminal must be Droid+Sans+Mono+Awesome.ttf

All scripts/bin folders are defined in the variable $PATH.

## 💻 Update

```
cd ~/.dotfiles && ./setup.sh update
```

## ⛄ Dotfiles

All static dotfiles are stored in the [./configs](./configs) folder. Via `./setup install` or `./setup update` the files are linked to the home directory. The folder structure of configs is kept in the home directory.

## 👽 Scripts

List of all scripts in [./bin](./bin).

- **sleeps** - sleeps is an extension of **sleep** with a visual representation of the waiting time

## 💥 Docker

The container files are in [./docker](./docker) and the associated scripts in [./docker-bin](./docker-bin).
When a script is called and the container does not exist, it is automatically built.

Containers can be created and deleted manually:

- dotfiles-docker-build-\<container name\> (e.g. `dotfiles-docker-build-latex`)
- dotfiles-docker-rm-\<container name\> (e.g. `dotfiles-docker-rm-latex`)

You can also create or delete all containers at once:

- dotfiles-docker-all-build
- dotfiles-docker-all-rm

#### Containers (with scripts)

- **latex** - a container with texlive. The following scripts are available:
  - pdflatex
  - xelatex

## 👻 Homebrew (macOS only)

[Homebrew](https://brew.sh) is a package manager for macOS.

The following scripts are installed:

| Category     | Packages                                             |
| ------------ | ---------------------------------------------------- |
| Fuse         | osxfuse, sshfs                                       |
| Monitoring   | htop, iftop                                          |
| Networking   | fping, nmap , speedtest-cli                          |
| PDF          | gs, qpdf                                             |
| Runtimes     | nodejs                                               |
| Shell        | zsh                                                  |
| System Tools | f3, nano, tree, unrar, wget, p7zip                   |
| Videos       | atomicparsley, ffmpeg, mkvtoolnix, mp4v2, youtube-dl |

#### Scripts

List of all scripts in [./brew-bin](./brew-bin).

- **brew-clear.sh** - deletes the old versions of the packages from Homebrew (e.g. `brew-clear.sh`).
- **flash-check.sh** - checks flash memory cards for their size (e.g. `flash-check.sh /path/to/flashcard`). The flash memory card should be empty.
- **pdf-merged.sh** - merges many PDF files into one (e.g. `pdf-merged.sh 1.pdf 2.pdf`).
- **pdf-smaller.sh** - reduce the size of a PDF, if possible (e.g. `pdf-smaller.sh 1.pdf`).
