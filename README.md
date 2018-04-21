# convertible-tools

Scripts to improve usability in convertible laptops.

Environment variables from the current user are needed, `generate.sh` will set up it with values from the cloned directory. `install.sh` automatically copies the generated files

## Lid closing

This scripts uses acpi to disable the touchscreen when the lid is closed, enabling it when is open

To install it you need to copy:
- `acpi/events/lid` to `/etc/acpi/events/lid`
- `acpi/lid.sh` to `/etc/acpi/lid.sh`

And restart acpi

## Screen rotation

`autorotate` uses [iio-sensor-proxy](https://github.com/hadess/iio-sensor-proxy) to listen to orientation changes and rotate the screen using xrandr and xinput. `generate.sh` creates a .desktop entry to add it to the autostart of your desktop environment (probably `~/.config/autostart`)

Depends on the package `python-pydbus`

Automatic rotation can be disabled running the script with arguments:

```
autorotate [enable | disable | toggle]
```
