# Dotfiles 🎃

My dotfiles library

## install

```
git clone https://github.com/kettil/dotfiles ~/.dotfiles

cd ~/.dotfiles

./setup.sh install
```

The font of the terminal must be Droid+Sans+Mono+Awesome.ttf

## update

```
cd ~/.dotfiles

git pull

./setup.sh update
```

## dotfiles

All static dotfiles are stored in the [configs](./configs) folder. Via `./setup install` or `./setup update` the files are linked to the home directory. The folder structure of configs is kept in the home directory.
