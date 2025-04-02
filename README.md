A sample invocation of GNU Stow with the zed config files:
```bash
stow -d ~/dotfiles/dots --dotfiles --target ~ zed
```

Removing the symlinks is as simple as:
```bash
stow -D -d ~/dotfiles/dots --dotfiles --target ~ zed
```
