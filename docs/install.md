# Installation

Here a the few rough steps to follow to install this configuration on system.

## With Encryption

You can refer to this [guide](https://github.com/Jadarma/nixfiles/blob/main/docs/src/getting_started/install.md)
(which I used) to setup your system with LVM & LUKS full-disk encryption.

> [!CAUTION]
>
> Refer to this [file](./luks.md#keyboard-layout) to avoid problems related to
> keyboard layout when entering LUKS password.
>
> It shouldn't be needed, but I still recommend to it as it appear the best way
> to ensure everything will work as expected.

## Without Encryption

1. Download and Install NixOS from the [official site](https://nixos.org/download).
2. Temporarily install ripgrep, fish and git using the command: `nix-shell -p ripgrep fish git --run fish`.
3.You can also use classic bash and grep for the next step without installing fish and ripgrep.
3. Run the command `rg --hidden FIXME` and change/add lines to match your device, swaps, partitions, peripherals, file systems, etc. in the configuration files.

> [!IMPORTANT]
>
> I highly recommend you to go throught all the configurations files and ensure everything is configured to your needs.
>
> Don't forget to delete or change settings and configurations that are unique to you, like **git** settings, **username**, etc ...

4. Enable `flake` support (more [right here](https://nixos.wiki/wiki/Flakes#Enable_flakes_temporarily)) on your current system. Don't forget to run `sudo nixos-rebuild switch` after enabling `flake` in your `/etc/configuration.nix`.
5. Clone this repository

    ```sh
    git clone https://github.com/leoraclet/nixos-config
    ```

6. Then, `cd nixos-config`
7. Run the command `sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --flake ./#your-hostname --upgrade`. Don't forget to replace `your-hostname` with your hostname before running the command; by default, hostname is set to `leonne`.
