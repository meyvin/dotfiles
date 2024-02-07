### Greeting
set -g fish_greeting

## Env variables
set -gx _JAVA_AWT_WM_NONREPARENTING "1"
set -gx ECORE_EVAS_ENGINE "wayland"
set -gx EDITOR "nvim"
set -gx ELM_ENGINE "wayland"
set -gx GTK_THEME "Adwaita:dark"
set -gx QT_QPA_PLATFORM "wayland;xcb"
set -gx MOZ_ENABLE_WAYLAND "1"
set -gx QT_QPA_PLATFORMTHEME "qt5ct"
set -gx QT_WAYLAND_DISABLE_WINDOWDECORATION "1"
set -gx SDL_VIDEODRIVER "wayland"
set -gx VISUAL "textadept"
set -gx XDG_CURRENT_DESKTOP "Sway"
set -gx XDG_SESSION_DESKTOP "Sway"
set -gx XDG_SESSION_TYPE "wayland"

### Paths
fish_add_path /var/lib/flatpak/exports/share
fish_add_path /var/lib/flatpak/exports/bin
fish_add_path /var/lib/snapd/desktop/applications/
fish_add_path ~/.config/composer/vendor/bin
fish_add_path ~/.local/bin
fish_add_path ~/.local/share/JetBrains/Toolbox/scripts

### Alias
alias fishconf="nvim ~/.config/fish/config.fish"
alias swayconf="nvim ~/.config/sway/config"
alias sail="vendor/bin/sail"
alias vi="nvim"
alias vim="nvim"
