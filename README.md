This is where I put configs.  I'm following patterns found here: https://github.com/Misterio77/nix-starter-configs 

### Adding a new machine

1. install nixos

2. make this repo authoritative and create links

```
nix-shell -p git helix

# clone this repo
ssh-keygen -t ed25519
cat ~/.ssh/id_ed25519.pub # go tell github about the new key
git clone git@github.com:MatrixManAtYrService/home4.git
cd home4

# make it authoritative
sudo mv /etc/nixos choedankal
sudo chown -R matt choedankal/
sudo ln -s /home/matt/src/home4/choedankal/ /etc/nixos
ln -s /home/matt/src/home4 /home/matt/.config/nixos

# set your hostname
hx choedankal/configuration.nix
sudo nixos-rebuild switch
hostname # you should see your new hostname, not "nixos"
```

3. Add an entry in flake.nix
