#!/bin/bash
source constants

if [ ! -e $LID_FILE ]
then
    echo "$LID_FILE doesn't exists, please run generate.sh"
    exit 0
fi

if [ ! -e $DESKTOP_FILE ]
then
    echo "$DESKTOP_FILE doesn't exists, please run generate.sh"
    exit 0
fi


echo "Copying files to /etc/acpi"

sudo cp $LID_FILE /etc/$LID_FILE
sudo cp $LID_EVENTS /etc/$LID_EVENTS

echo "Don't forget to restart the acpi service"

echo "Copying .desktop files to $HOME/.config/autostart"

cp $DESKTOP_FILE $HOME/.config/autostart/$(basename $DESKTOP_FILE)