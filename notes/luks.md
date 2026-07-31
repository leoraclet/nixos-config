# LUKS Encryption

## Keyboard layout

When using LUKS encryption, the default key map used at the password prompt is
US QWERTY.

To avoid issues caused by mismatched keyboard layouts, you can follow
[this Stack Overflow answer](https://unix.stackexchange.com/questions/174572/unable-to-open-luks-encrypted-device-wrong-password/174657#174657)
to add an additional key for decrypting the LUKS device.
