This set of dot- and rc files mostly defines my shell working
environment (mostly Mac, also used on a Linux box).

Main applications:
 * Spacemacs
 * zsh ([oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh))
 * git
 * tmux
 * [starship](https://starship.rs/) for shell prompts

## Setting up on a new machine

```sh
# Install rcm
brew install rcm

# Clone this repo
git clone <repo-url> ~/git/portable-environment

# Link all dotfiles
rcup -d ~/git/portable-environment
```

For Claude Code config, remove any existing files before running `rcup` so rcm
can place its symlinks:

```sh
rm -f ~/.claude/settings.json
rm -rf ~/.claude/scripts
rcup -d ~/git/portable-environment
```

Notable mentions:
 * [rcm](https://github.com/thoughtbot/rcm) (dotfile management)
 * Default apps for brew/brew cask
 * osx (setup sane development defaults on OS X)
 * Emacs keybindings for most of OS X (through Library/KeyBindings)
