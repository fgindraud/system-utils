Ubuntu with LXQT desktop environment.

X server.

i3 as window manager with the usual config.
Some keybindings specific to lxqt for session stuff ; see i3 config file.

LXQT integrates an autostart launcher.
NetworkManager in xdg autostart. nm-applet disabled, otherwise conflicts.

LXQT has a daemon that handles monitor config.
Did not use my own.

LXQT pulls xscreensaver which is annoying.
Replaced by xautolock : disable autostart of Xscreensaver component, and add xautolock one using i3lock
See https://github.com/lxqt/lxqt/wiki/ConfigScreensavers

