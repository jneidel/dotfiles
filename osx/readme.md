# OSX

OSX specific apps, config files and notes.

## iTerm2 (Terminal)

To activate your powerline font: `Profiles > Text > Font > Change Font`.

[View iTerm colorscheme](https://raw.githubusercontent.com/jneidel/dotfiles/master/osx/brogrammer.itermcolors)

The iTerm colorscheme will need to imported in the iTerm options: `Profiles > Colors > Color Presets > Import` and selected in the same dropdown after the import.

## Notes

**Set key repeat:**

- 'Initial key repeat' describes the time it takes, after holding down a key, to output the next one.
- 'Key repeat' described the time it takes, after the intial key repeat, to product the next.

Initial key repeat: `defaults write -g InitialKeyRepeat -int 10`

Key repeat: `defaults write -g KeyRepeat -int 1`

In the system preferences these are normally restricted to 15 (225 ms) and 2 (30 ms) for initial key repeat and key repeat respectively.

Restart to take effect.

**Update bash:**

Your bash version is 10 years out of date as Apple does not want to conform to the 'new' licence.

[How to update bash](https://itnext.io/upgrading-bash-on-macos-7138bd1066ba)

