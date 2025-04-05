A sample invocation of GNU Stow with the zed config files:
```bash
stow -d ~/dotfiles/dots --dotfiles --target ~ zed
sudo stow -d ~/dotfiles/hosts --dotfiles --target / echoes
```

Removing the symlinks is as simple as:
```bash
stow -D -d ~/dotfiles/dots --dotfiles --target ~ zed
```
