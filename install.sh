#!/bin/bash
source constants

for f in $LID_FILE $DESKTOP_FILE $TOGGLE_FILE
do
    if [ ! -e $f ]
    then
        echo "$f doesn't exists, please run generate.sh"
        exit 0
    fi
done

echo "Copying files to /etc/acpi"

sudo cp $LID_FILE /etc/$LID_FILE
sudo cp $LID_EVENTS /etc/$LID_EVENTS

echo "Don't forget to restart the acpi service"

echo "Copying .desktop files to $HOME/.config/autostart"

cp $DESKTOP_FILE $HOME/.config/autostart/$(basename $DESKTOP_FILE)

if [ $(which xdg-user-dir) ]
then
    TOGGLE_DEST=$(xdg-user-dir DESKTOP)
else
    TOGGLE_DEST="$HOME/Desktop"
fi

echo cp $TOGGLE_FILE $TOGGLE_DEST/$(basename $TOGGLE_FILE)