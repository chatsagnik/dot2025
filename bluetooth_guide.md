## Install Bluetooth

The following command enables bluetooth to run after every boot. Change enable to start for bluetooth to run on a per session basis.

> sudo systemctl enable bluetooth.service

Install bluez and bluez-utils

> sudo pacman -S --needed bluez bluez-utils

Start Bluetooth using 'bluetoothctl'
- power on (might encounter error here)
- scan on 
- trust MAC
- pair MAC
- connect MAC

and voila! We are ready to use our bluetooth device..... if power on step has worked. Otherwise check if ports are soft/hard blocked using the following command:

> rfkill list | grep -A 2 'Bluetooth$'

This might  produce an output such as:

1: hci0: Bluetooth
	Soft blocked: yes
	Hard blocked: no

2: ideapad\_bluetooth
    Soft blocked: yes
    Hard blocked: no

In order to unblock simply use the command, where portnumber is 1 or 2 (according to above output):
> rfkill unblock <portnumber>

Now resume with bluetoothctl command.
