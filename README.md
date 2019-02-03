# Installation

``` sh
git clone https://github.com/dacci/dotfiles.git
cd dotfiles
./install.sh
```

# Structure

## home/

Contains dotfiles to be installed directly into user's home directory.

## config/

Contains directories to be installed into platform specific profile directory such as:

- `%APPDATA%` on Windows
- `$HOME/Library/Application Support` on macOS
- `$HOME/.config` on Linux
