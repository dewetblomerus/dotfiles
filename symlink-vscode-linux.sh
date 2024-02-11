rm -f ~/.config/Code/User/settings.json
ln -s ~/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json

rm -f ~/.config/Code/User/keybindings.json
ln -s ~/dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json

rm -rf ~/.config/Code/User/snippets
ln -s ~/dotfiles/vscode/user_snippets ~/.config/Code/User/snippets
