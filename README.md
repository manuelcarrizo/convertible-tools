# convertible-tools

Scripts to improve usability in convertible laptops running Linux and Xorg.

Tested on an Asus ux360uak

Environment variables from the current user are needed, `generate.sh` will set up it with values from the cloned directory. `install.sh` automatically copies the generated files

## Lid closing

This scripts uses acpi to disable the touchscreen when the lid is closed, enabling it when is open

To install it you need to copy:
- `acpi/events/lid` to `/etc/acpi/events/lid`
- `acpi/lid.sh` to `/etc/acpi/lid.sh`

And restart acpi

## Screen rotation

`autorotate` uses [iio-sensor-proxy](https://github.com/hadess/iio-sensor-proxy) to listen to orientation changes and rotate the screen using xrandr and xinput. `generate.sh` creates a .desktop entry to add it to the autostart of your desktop environment (probably `~/.config/autostart`)

By default the rotation is disabled if more than one monitor is detected, you can change this behaviour
setting the value of SINGLE_MONITOR to False on `autorotate`

The touchpad is disabled by default in all the orientations except normal, you can change this behaviour setting the value of DISABLE_TOUCHPAD to False on `autorotate`

Depends on the package `python-pydbus`

Automatic rotation can be disabled running the script with arguments:

```
autorotate [enable | disable | toggle]
```

A shortcut to the toggle action is copied to the Desktop folder for easy access

## Extras for KDE

### Panel

You can set the height of the panel modifying the file `$HOME/.config/plasmashellrc`,
look for the key `thickness` in sections named:

```
[PlasmaViews][Panel 2][Horizontal1080]
```
or
```
[PlasmaViews][Panel 2][Horizontal1920]
```

### On screen keyboard

I added a kwin rule to set the virtual keyboard `onboard` on top of other windows and maximized horizontally
