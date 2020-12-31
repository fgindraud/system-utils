Store various examples of user-level rc files for reference.
They must be adapted for each machine.

The zsh setup is in the fork of zprezto.

Slam is installed as a python egg, then the launcher is copied to ~/.config/slam

~/.local/bin is added to path and contain symlink to useful binaries.

Vim plugins with pathogen.
Plugins: vim-clang-format

Audio: Mostly ALSA
VLC setup to manually prefer ALSA.
Pulseaudio server "systemctl --user enabled".
Config has been modified to a "dump pipe mode".
This seems sufficient to use firefox.

Japanese chars: otf-ipafont
