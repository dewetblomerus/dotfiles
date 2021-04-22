rm ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
rm ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
rm -rf ~/Library/Application\ Support/Code/User/snippets
ln -s ~/dotfiles/vscode/user_snippets ~/Library/Application\ Support/Code/User/snippets
