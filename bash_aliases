alias copy="xclip -selection clipboard"


# Volume aliases
alias volup="pactl set-sink-volume @DEFAULT_SINK@ +20%"
alias voldown="pactl set-sink-volume @DEFAULT_SINK@ -20%"
alias volmute="pactl set-sink-mute @DEFAULT_SINK@ toggle"
alias volset='pactl set-sink-volume @DEFAULT_SINK@'  # usage: volset 50%
alias volstatus="pactl get-sink-volume @DEFAULT_SINK@ && pactl get-sink-mute @DEFAULT_SINK@"

# Brightness aliases
alias brup="brightnessctl set +20%"
alias brdown="brightnessctl set 20%-"
alias brset='brightnessctl set'  # usage: brset 50%
alias brstatus="brightnessctl"

# Quick mount/unmount aliases
alias usbmount='sudo mount /dev/sda1 /mnt/usb-drive'
alias usbumount='sudo umount /mnt/usb-drive'
alias usb='cd /mnt/usb-drive'

# Check if USB is connected
alias usbcheck='lsblk | grep sda1'

alias dock-audio='pactl set-default-sink $(pactl list short sinks | grep "usb-Generic_USB_Audio.*HiFi__hw_Dock__sink" | head -1 | awk "{print \$2}") && pactl set-default-source $(pactl list short sources | grep "usb-Generic_USB_Audio.*HiFi__hw_Dock__source" | head -1 | awk "{print \$2}")'

alias builtin-audio='pactl set-default-sink $(pactl list short sinks | grep "pci-0000_00_1f.3.*analog-stereo" | grep -v monitor | head -1 | awk "{print \$2}") && pactl set-default-source $(pactl list short sources | grep "pci-0000_00_1f.3.*analog-stereo" | grep -v monitor | head -1 | awk "{print \$2}")'

# SSH stuff
alias ssh='kitty +kitten ssh'
