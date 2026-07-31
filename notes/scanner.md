# Scanner

First, configure scanning in NixOS following the [wiki](https://wiki.nixos.org/wiki/Scanners).

To scan a document from the terminal, use the following command:

```bash
scanimage --device <your-device> --format=png > output.png
```

> [!TIP]
>
> You can use `scanimage -L` to list all available scanners.
