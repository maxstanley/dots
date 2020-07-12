# Arch Dots

## Creating a SWAP File

[Source](https://unix.stackexchange.com/questions/294600/i-cant-enable-swap-space-on-centos-7)

```bash
$ # 4096 = 4GB, 8192 = 8GB
$ dd if=/dev/zero of=/swapfile count=4096 bs=1MiB
$ chmod 600 /swapfile
$ mkswap /swapfile
$ swapon /swapfile

$ # Add this line to /etc/fstab
/swapfile swap swap sw 0 0

$ sysctl vm.swappiness=10

$ # Add these lines to /etc/sysctl.conf
vm.swappiness = 10
vm.vfs_cache_pressure = 50
```
