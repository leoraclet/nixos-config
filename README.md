<div align="center"><img style="width: 300px" src="./assets/nixos-logo.png"></div>
<h1 align="center">NixOS & Hyprland Config</h1>

<div align="center">

![nixos](https://img.shields.io/badge/NixOS-24273A.svg?style=flat&logo=nixos&logoColor=CAD3F5)
![nixpkgs](https://img.shields.io/badge/nixpkgs-unstable-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8aadf4)
![hyprland](https://img.shields.io/badge/hyprland-stable-informational.svg?style=flat&logo=wayland&logoColor=eed49f&colorA=24273A&colorB=91d7e3)
<br>
![Language](https://img.shields.io/badge/Language-Nix-1d50de)
![Size](https://img.shields.io/badge/Size-23Mo-f12222)
![OSS](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)

</div>

## Table of Contents

- [📖 About](#-about)
- [📦 Content](#-content)
- [🐟 Useful aliases in Fish Shell](#-useful-aliases-in-fish-shell)
- [🛠️ Developement Environment](#️-developement-environment)
- [🚀 Installation](#-installation)
    - [With Encryption](#with-encryption)
    - [Without Encryption](#without-encryption)
- [📝 Tips \& Tricks](#-tips--tricks)
    - [Discord](#discord)
    - [Home Manager](#home-manager)
    - [Change MAC address](#change-mac-address)
    - [Show battery status](#show-battery-status)
    - [How to Reset Your OpenWebUI Password](#how-to-reset-your-openwebui-password)
    - [Night mode switch](#night-mode-switch)
    - [Install VSCodium Extensions](#install-vscodium-extensions)
        - [Manual](#manual)
        - [Automatic](#automatic)
        - [With Extensions](#with-extensions)
    - [Printing \& Scanning](#printing--scanning)
        - [Printing](#printing)
        - [Scanning](#scanning)
    - [LUKS keyboard layout](#luks-keyboard-layout)


## 📖 About

This repository houses my NixOS ❄️ configuration, using Hyprland ad Noctalia, with full-disk encryption.

## 🛠️ Developement Environment

> [!NOTE]
>
> I mainly code in Python, C / C++, Typescript / Javascript and some basic HTML, CSS, but I would
> like to learn and use Go.
>
> I also regularly use Markdown and Latex for documents editing.

To set up my different developement environments, I use `flake.nix` with those great
[templates](https://github.com/the-nix-way/dev-templates/) as a starting point, that I then extend
to my needs.

It provides a local, consistent and reproducible environment for each project in every programming /
scripting language, and I find it the most practical way to get things done.

> [!IMPORTANT]
>
> It works particularly well for C / C++ projects where I need to use libraries like SFML, SDL or
> Dear ImGUI, because it would be a **PAIN** to setup otherwise.

I also use [direnv](https://direnv.net/) to automatically load the developement environement in the
shell when I'm in the directory (do `direnv allow` in the project directory to make it happen).

> [!TIP]
>
> There are also the [devenv](https://devenv.sh/) and [devbox](https://www.jetify.com/devbox)
> projects that are even simplier to work with and configure when beginning.

## 🚀 Installation

> [!NOTE]
>
> This section is mostly for my personal use, but feel free to use it if you want to.

### With Encryption

> [!IMPORTANT]
>
> This is how **MY** system is configured by default from now on

You can refer to this [guide](https://github.com/Jadarma/nixfiles/blob/main/docs/src/getting_started/install.md) (which I used) to setup your system with LVM & LUKS full-disk encryption.

> [!CAUTION]
>
> Refer to this [section](#luks-keyboard-layout) to avoid problems related to keyboard layout when entering LUKS password.
>
> It shouldn't be needed, but I still recommend to it as it appear the best way to ensure everything will work as expected.

### Without Encryption

1. Download and Install NixOS from the [official site](https://nixos.org/download).
2. Temporarily install ripgrep, fish and git using the command: `nix-shell -p ripgrep fish git --run fish`. You can also use classic bash and grep for the next step without installing fish and ripgrep.
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

## 📝 Tips & Tricks

> [!NOTE]
>
> This section mostly contains fixes and tips related to issues that I have encountered while
> configuring NixOS

### Discord

When launching Discord for the first time with my current configuration, it will crash because
OpenASAR can't find the Discord config files. To fix this issue, just launch Discord a first time as
a standalone program before running it the usual way.

```bash
NIXPKGS_ALLOW_UNFREE=1 nix run --impure nixpkgs\#discord
```

### Home Manager

If problems arise when switching to new configuration, you can see home-manager's related errors
with the following command

```bash
journalctl -u home-manager-leonne.service -b
```

### Change MAC address

```bash
sudo ifconfig wlan0 down
sudo macchanger -m 24:95:2f:d2:bc:79 wlan0
sudo ifconfig wlan0 up
```

### Show battery status

To enumerate all power devices, execute

```bash
upower --enumerate
```

Then to show information on the battery (for example)

```bash
upower -i (upower --enumerate | grep battery)
```

### How to Reset Your OpenWebUI Password

For detailed instructions, please refer to [this link](https://docs.openwebui.com/troubleshooting/password-reset/).

The database is stored in the directory `/var/lib/open-webui`.

In my experience, the most straightforward solution was to delete the database entirely:

```bash
sudo rm -rf /var/lib/open-webui/webui.db
```

### Night mode switch

```bash
hyprsunset --temperature 2500
```

or

```bash
hyprsunset --help  # To see all avaible commands
```

### Install VSCodium Extensions

#### Manual

On machine A

```bash
code --list-extensions | xargs -L 1 echo code --install-extension > install-vscode-extensions.sh
```

On machine B

```bash
chmod +x install-vscode-extensions.sh
./install-vscode-extensions.sh
```

#### Automatic

Use the built-in [`Settings Sync`](https://aka.ms/vscode-settings-sync-help) functionality of VSCode.

#### With Extensions

- [**Syncing**](https://github.com/nonoroazoro/vscode-syncing/tree/master/src/core) (*works great*) - Sync all of your VSCode settings across multiple devices
- [**local sync**](https://github.com/AnWeber/vscode-local-sync) - Sync your settings to a local directory

### Printing & Scanning

#### Printing

> [!NOTE]
> If you're connected to a printer via USB, you may first verify that the printer is detected by the system using the command `lsusb`.

First, configure printing in NixOS following the [wiki](https://wiki.nixos.org/wiki/Printing).

Then, to list all available printers, use the following command:

```bash
lpstat -a
```

> [!CAUTION]
> If you don't see any printers, you may need to install the printer drivers. For example, for a Canon printer, you may need to install `cnijfilter2`.
>
> Then to add the printer, go to the CUPS web interface at `https://127.0.0.1:631` and add the printer manually.

To print a document from the terminal, use the following command:

```bash
lp -d <printer-name> <file-name>
```

#### Scanning

First, configure scanning in NixOS following the [wiki](https://wiki.nixos.org/wiki/Scanners).

To scan a document from the terminal, use the following command:

```bash
scanimage --device <your-device> --format=png > output.png
```

> [!TIP]
>
> You can use `scanimage -L` to list all available scanners.

### LUKS keyboard layout

When using LUKS encryption, the default key map used at the password prompt is US QWERTY.

To avoid issues caused by mismatched keyboard layouts, you can follow [this Stack Overflow answer](https://unix.stackexchange.com/questions/174572/unable-to-open-luks-encrypted-device-wrong-password/174657#174657) to add an additional key for decrypting the LUKS device.

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
