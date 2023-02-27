#!/usr/bin/bash
# Checks if explicit packages are in fact dependencies.

for pkg in $(pacman -Qeq); do
	echo $pkg $(pacman -Qi $pkg | grep Required);
done
