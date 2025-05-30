# Backup nix configuration files
```bash
# Do not remove or rename the folder /etc/nixos, but keep /etc/nixos folder.
# Because `stow` only handles one layer of symbolic link trasnformation.
sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration_backup.nix
sudo mv /etc/nixos/hardware-configuration.nix /etc/nixos/hardware-configuration_backup.nix
```


# How to make it work?
```bash
cd ~/dotfiles
sudo stow -d ~/dotfiles --dotfiles --target / echoes
or
sudo stow -d ~/dotfiles --dotfiles --target / crazy-diamond
```


# NixOS

Before installation, run these lines:
```bash
# NOTE: I ignored the following step for tracing my hardware-configuration.nix for now.
sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware

# for unstable zeditor
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable

# for upgrading to NixOS 25.05
sudo nix-channel --add https://nixos.org/channels/nixos-25.05 nixos
sudo nix-channel --list

sudo nix-channel --update
```

After stow-ing files:
```bash
sudo nix-channel --update && sudo nixos-rebuild switch --upgrade && sudo nix-collect-garbage -d
```


# Removing the symlinks is as simple as:
```bash
sudo stow -D -d ~/dotfiles --dotfiles --target / <hostname>
```

---
# Hosts

## Host `echoes` is the laptop "Dell Vostro 5410".
![image](https://github.com/user-attachments/assets/0436c971-236b-41be-ad7b-fc13cdfaa38b)

## [Echoes](https://jojo.fandom.com/wiki/Echoes) is the Stand of Koichi Hirose, featured primarily in Diamond is Unbreakable and appearing briefly in Vento Aureo. 
![image](https://github.com/user-attachments/assets/debedb99-b846-44cf-b237-5bb3634b99ba)


## Host `crazy-diamond` is the laptop "Lenovo ThinkPad P16v".
![image](https://github.com/user-attachments/assets/c7b56451-5142-4e99-a1f0-2841d215b4f4)

## [Crazy Diamond](https://jojo.fandom.com/wiki/Crazy_Diamond) is the Stand of Josuke Higashikata, featured in Diamond is Unbreakable.
![image](https://github.com/user-attachments/assets/c6f84d00-cbf6-4344-a20a-15f351798911)



# References
1. https://github.com/mbledkowski/dotfiles
2. https://sr.ht/~bwolf/dotfiles
