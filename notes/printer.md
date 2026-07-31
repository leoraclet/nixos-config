# Printer

> [!NOTE]
> If you're connected to a printer via USB, you may first verify that the printer
> is detected by the system using the command `lsusb`.

First, configure printing in NixOS following the [wiki](https://wiki.nixos.org/wiki/Printing).

Then, to list all available printers, use the following command:

```bash
lpstat -a
```

> [!CAUTION]
> If you don't see any printers, you may need to install the printer drivers.
> For example, for a Canon printer, you may need to install `cnijfilter2`.
>
> Then to add the printer, go to the CUPS web interface at `https://127.0.0.1:631`
> and add the printer manually.

To print a document from the terminal, use the following command:

```bash
lp -d <printer-name> <file-name>
```
