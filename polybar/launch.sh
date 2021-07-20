#!/bin/bash

# Terminate already running poybar instance
killall -q polybar

# Wait until the process have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar using config
polybar example &
