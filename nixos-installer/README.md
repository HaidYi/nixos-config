# Minimal NixOS Installation using Flakes

This guide provides instructions for a basic NixOS installation using the **Minimal** ISO image and Flakes. It serves as a starting point for users to set up their own NixOS configurations, as the `.nix` files can be easily copied and reused in other projects. After installation, your system will have:

- Basic utilities for editing and downloading code (e.g., `neovim`, `curl`, `git`)
- [Disko](https://github.com/nix-community/disko)-based disk partitioning and encryption
- File and settings persistence between boots via [impermanence](https://github.com/nix-community/impermanence)

## Step-by-step Installation

### 1. Prepare the Installation Media

1. Download the minimal NixOS image.
2. Flash it to a USB drive using a tool like [Etcher](https://etcher.balena.io/) or your preferred method.
3. Boot from the USB on the target machine.

Note: The default user is `nixos`. For system-level operations, either switch to root with `sudo su -` or prefix commands with `sudo` when encountering permission issues.

### 2. Configure the Network

#### For Wired Connections:
If DHCP is enabled on your router, you should automatically connect to the network.

#### For Wi-Fi:
1. Start `wpa_supplicant`: `systemctl start wpa_supplicant`
2. Run `wpa_cli` and enter the following commands:

```bash
> add_network
0
> set_network 0 ssid "yourWifiName"
OK
> set_network 0 psk "yourWifiPassword"
OK
> set_network 0 key_mgmt WPA-PSK
OK
> enable_network 0
OK
```

3. Verify the connection by pinging a public address (e.g., `ping google.com`).

### 3. Prepare Encryption Key

1. Partition a USB drive for the encryption key:
```bash
DEV=/dev/sdX  # Replace X with the correct letter (use `fdisk -l` or `lsblk` to identify)
parted $DEV -- mklabel gpt
parted $DEV -- mkpart primary 2M 512MB
mkfs.fat -F 32 -n NIXOS_DSC ${DEV}1
```

2. Generate and save the keyfile:
```bash
KEYFILE=./nixos-luks-keyfile
dd bs=512 count=64 iflag=fullblock if=/dev/random of=$KEYFILE
DEVICE=/dev/disk/by-label/NIXOS_DSC
dd bs=512 count=64 iflag=fullblock seek=128 if=$KEYFILE of=$DEVICE
```

### 4. Partition the Disk

Use Disko to partition and format the disk:

```bash
nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./disk-op/disko-partition.nix
```

Note: If you encounter a mounting error for `/dev/mapper/XXXX`, simply re-run the command.

#### Disk Partition Details:
- NVMe drive with two partitions:
  1. 648M `FAT32` boot partition
  2. `LUKS`-encrypted root partition using the remaining space
- Root (`/`) mounted as `tmpfs` in RAM (lost on shutdown)
- Root partition uses `btrfs` with subvolumes for `/nix`, `/persistent`, `/tmp`, `/snapshot`, and a 2GB swapfile

### 5. Generate NixOS Configuration

```bash
nixos-generate-config --no-filesystems --root /mnt
```

### 6. Generate Password and SSH Keys

1. Create a hashed password:
```bash
mkpasswd -m scrypt
```

2. Generate SSH key pairs:
```bash
ssh-keygen -t ed25519 -a 256 -C "<comments>" -f ~/.ssh/xxx
```

3. Update the `myvars` variable in `flake.nix` with your new password and public key.

### 7. Install NixOS

1. Copy configuration files:
```bash
cp *.nix /mnt/etc/nixos
```

2. Install NixOS:
```bash
nixos-install --root /mnt --flake '/mnt/etc/nixos#<flake-output>' --no-root-password
```

> [!Note]
> Set flag `--no-root-password` because we use `initialHashedPassword` to set the password, or it will give 
> a prompt to let you type the password for `root` user. Moreover, even if we set the root password by 
> removing `--no-root-password`, the root password won't be saved after rebooting.

### 8. Optional: Pre-reboot Steps

1. Save the NixOS configuration for future use:
```bash
cp -r nixos-config/* /mnt/persistent/home/{user_name}/nixos-config
cp -r nixos-config/.git /mnt/persistent/home/{user_name}/nixos-config
cp /mnt/etc/nixos/{configuration,hardware-configuration}.nix /mnt/persistent/home/{user_name}/nixos-config/nixos-installer 
```

2. Remove the generated configuration:
```bash
rm -f /mnt/etc/nixos
```

3. Add a backup password for disk decryption:
```bash
keyfile=/dev/disk/by-label/NIXOS_DSC
dd if=$keyfile bs=512 skip=128 count=64 > nixos-luks-keyfile
cryptsetup luksAddKey /dev/{your encrypted partition} --key-file ./nixos-luks-keyfile
```

### 9. Finalize Installation

```bash
sync
swapoff /mnt/swap/swapfile
umount -R /mnt
cryptsetup close /dev/mapper/crypted-nixos
reboot
```

Remove the USB drive and reboot your computer.

## FAQ

Q: Will Disko repartition my disk when updating my configuration in the future?
A: No, the Disko module is idempotent. Once the partitions are created, subsequent `nixos-rebuild switch` commands won't alter the existing partition structure unless you explicitly change the Disko configuration.
