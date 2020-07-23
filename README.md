# Dotfiles 🎃

My dotfiles library

![zsh example](./files/example.jpg)

## 🎯 Install

```bash
git clone https://github.com/kettil/dotfiles ~/.dotfiles

# on mac
xcode-select --install

cd ~/.dotfiles && ./setup.sh install
```

The font of the terminal must be Droid+Sans+Mono+Awesome.ttf

All scripts/bin folders are defined in the variable \$PATH.

## 💻 Update

```bash
cd ~/.dotfiles && ./setup.sh update
```

## ⛄ Dotfiles

All static dotfiles are stored in the [./configs](./configs) folder. Via `./setup install` or `./setup update` the files are linked to the home directory. The folder structure of configs is kept in the home directory.

## 👽 Scripts

List of all scripts in [./bin](./bin).

- **color-table.sh** - showed a color table in the shell (with color codes)
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

### Containers (with scripts)

- **hadolint** - a Dockerfile linter
  - hadolint
- **LaTeX** - a container with texlive.
  - pdflatex
  - xelatex
- **Pandoc** - a container with pandoc.
  - pandoc
  - pandoc-pdf (uses the LaTeX container)
  - pandoc-letter (uses the LaTeX container)

### Script: pandoc-letter

Create a german DIN 676 letter from a markdown file.
The LaTeX template for the letter is located at [pandoc/templates/letter.latex](pandoc/templates/letter.latex).

In folder [example/pandoc-pdf](example/pandoc-pdf) is an example.
The script `pandoc-letter letter.md` must be called in this folder.

### Script: pandoc-pdf

Converts a Markdown file to a PDF file.
The template [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template) is used.

## 👻 Homebrew (macOS only)

[Homebrew](https://brew.sh) is a package manager for macOS.

The following scripts are installed:

| Category     | Packages                                                         |
| ------------ | ---------------------------------------------------------------- |
| Development  | nodejs, helm                                                     |
| Fuse         | osxfuse, sshfs                                                   |
| Monitoring   | htop, iftop                                                      |
| Networking   | fping, nmap, speedtest-cli, postman                              |
| PDF          | gs, qpdf                                                         |
| Shell        | zsh                                                              |
| System Tools | f3, git, nano, p7zip, tree, unrar, wget, gnupg, jq, fzf, fd, bat |
| Videos       | atomicparsley, ffmpeg, mkvtoolnix, mp4v2, youtube-dl             |

### Scripts

List of all scripts in [./brew-bin](./brew-bin).

- **brew-clear.sh** - deletes the old versions of the packages from Homebrew (e.g. `brew-clear.sh`).
- **flash-check.sh** - checks flash memory cards for their size (e.g. `flash-check.sh /path/to/flashcard`). The flash memory card should be empty.
- **pdf-merged.sh** - merges many PDF files into one (e.g. `pdf-merged.sh 1.pdf 2.pdf`).
- **pdf-smaller.sh** - reduce the size of a PDF, if possible (e.g. `pdf-smaller.sh 1.pdf`).
