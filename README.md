# Dotfiles

This repo started with a copy from from
https://github.com/michaeljsmalley/dotfiles I would have forked his repo if I
wanted to deal with the hassle of only pulling in his script & readme but not
his dotfiles

This repository includes all of my custom dotfiles. They should be cloned to
your home directory so that the path is `~/dotfiles/`. The included setup script
creates symlinks from your home directory to the files which are located in
`~/dotfiles/`.

The setup script is smart enough to back up your existing dotfiles into a
`~/dotfiles_old/` directory if you already have any dotfiles of the same name as
the dotfile symlinks being created in your home directory.

I also prefer `zsh` as my shell of choice. As such, the setup script will also
clone the `oh-my-zsh` repository from my GitHub. It then checks to see if `zsh`
is installed. If `zsh` is installed, and it is not already configured as the
default shell, the setup script will execute a `chsh -s $(which zsh)`. This
changes the default shell to zsh, and takes effect as soon as a new zsh is
spawned or on next login.

So, to recap, the install script will:

1. Back up any existing dotfiles in your home directory to `~/dotfiles_old/`
2. Create symlinks to the dotfiles in `~/dotfiles/` in your home directory
3. Clone the `oh-my-zsh` repository from my GitHub (for use with `zsh`)
4. Check to see if `zsh` is installed, if it isn't, try to install it.
5. If zsh is installed, run a `chsh -s` to set it as the default shell.

Installation

---

```bash
git clone git://github.com/michaeljsmalley/dotfiles ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
```

Then choose to run the mac or linux script to symlink VSCode settings

Remember to close the terminal and open it again. Last time I forgot to do this
and `:PluginInstall` did not work in Vim. I ended up running
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
to get it to work.
