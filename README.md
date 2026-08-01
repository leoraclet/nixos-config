<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD041 -->

<div align="center">
<img alt="NixOS" width="300px" src="./assets/nixos-logo.png">

# ❄️ NixOS Configuration ❄️

![ci-badge](https://img.shields.io/static/v1?label=Built%20with&message=nix&color=blue&style=flat&logo=nixos&link=https://nixos.org&labelColor=111212)
![nixpkgs](https://img.shields.io/badge/nixpkgs-unstable-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8aadf4)

My current [NixOS](https://nixos.org/) and
[Home Manager](https://github.com/nix-community/home-manager/) configurations
</div>

![Desktop Preview](assets/preview.png)

## 📖 About

This repository houses my current [NixOS](https://nixos.org/) and
[Home Manager](https://github.com/nix-community/home-manager/) configurations,
using [**Hyprland**](https://hypr.land/) and [**Noctalia Shell**](https://noctalia.dev/),
with full-disk encryption.

You can learn more about this config by consulting my [notes](./docs) on the matter.

## 📦 Structure

> [!warning]
> TODO ...

## ❄️ Flake outputs

```bash
❯ nix flake show
├───devShells
│   └───x86_64-linux
│       └───default: development environment 'nix-shell'
├───nixosConfigurations
│   ├───iso: NixOS configuration
│   ├───leon: NixOS configuration
│   ├───leonne: NixOS configuration
│   ├───microvm: NixOS configuration
│   └───vps: NixOS configuration
└───packages
    └───x86_64-linux
        ├───default: package 'update-input'
        └───microvm: package 'microvm-qemu-microvm'
```

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE)
file for details.
