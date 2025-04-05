# Backup nix configuration files
```bash
sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration_backup.nix
sudo mv /etc/nixos/hardware-configuration.nix /etc/nixos/hardware-configuration_backup.nix
```

# A sample invocation of GNU Stow config files:
```bash
sudo stow -d ~/dotfiles --dotfiles --target / echoes
```

# Removing the symlinks is as simple as:
```bash
sudo stow -D -d ~/dotfiles --dotfiles --target / echoes
```

# Host `echoes` is a laptop "Dell Vostro 5410".
![image](https://github.com/user-attachments/assets/0436c971-236b-41be-ad7b-fc13cdfaa38b)


## Echoes is the Stand of Koichi Hirose, featured primarily in Diamond is Unbreakable and appearing briefly in Vento Aureo. 
![image](https://github.com/user-attachments/assets/debedb99-b846-44cf-b237-5bb3634b99ba)
