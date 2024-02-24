### Greeting
set -g fish_greeting

## Env variables
set -gx EDITOR "nvim"
set -gx LANG "en_US.UTF-8"
set -gx MOZ_USE_XINPUT2 "1"
set -gx QT_QPA_PLATFORMTHEME "qt5ct"
set -gx VISUAL "textadept"
set -gx XDG_CURRENT_DESKTOP "i3"
set -gx XDG_SESSION_DESKTOP "i3"
set -gx XDG_SESSION_TYPE "x11"

## Theming
set -gx GTK_THEME "Adwaita:dark"
set -gx GTK2_RC_FILES "/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc"
set -gx QT_STYLE_OVERRIDE "adwaita-dark"

### Paths
fish_add_path /var/lib/flatpak/exports/share
fish_add_path $HOME/.local/share/flatpak/exports/share
fish_add_path /var/lib/snapd/desktop/applications/
fish_add_path ~/.config/composer/vendor/bin
fish_add_path ~/.local/bin
fish_add_path ~/.local/share/JetBrains/Toolbox/scripts

### Alias
alias fishconf="nvim ~/.config/fish/config.fish"
alias i3conf="nvim ~/.config/i3/config"
alias sail="vendor/bin/sail"
alias sysyadm="sudo yadm --yadm-dir /etc/yadm --yadm-data /etc/yadm/data"
alias vi="nvim"
alias vim="nvim"
