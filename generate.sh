#!/bin/bash

source constants

echo "Generating acpi scripts"
cp $LID_TPL $LID_FILE

sed -i "s/DISPLAY_VALUE/${DISPLAY}/g" $LID_FILE
sed -i 's|XAUTHORITY_VALUE|'${XAUTHORITY}'|g' $LID_FILE

echo "Generating autorotate scripts"
cp $DESKTOP_TPL $DESKTOP_FILE
cp $TOGGLE_TPL $TOGGLE_FILE

sed -i 's|BASE_DIR|'$(pwd)'|g' $DESKTOP_FILE
sed -i 's|BASE_DIR|'$(pwd)'|g' $TOGGLE_FILE
