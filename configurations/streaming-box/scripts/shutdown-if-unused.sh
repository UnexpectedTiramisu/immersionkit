#!/bin/bash

TIMEOUT=300

echo "Watching for user input for ${TIMEOUT} seconds..."

if timeout "${TIMEOUT}" \
    stdbuf -oL libinput debug-events 2>/dev/null |
    grep -m1 -E 'KEYBOARD_KEY|POINTER_MOTION|POINTER_BUTTON|POINTER_AXIS|TOUCH_DOWN|TOUCH_MOTION'
then
    echo "User activity detected. Automatic shutdown cancelled for this boot."
    exit 0
fi

echo "No user activity detected during first ${TIMEOUT} seconds. Powering off."
systemctl poweroff