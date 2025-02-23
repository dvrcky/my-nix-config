{
  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig =
      ''# Please note not all available settings / options are set here.
# For a full list, see the wiki
#

# See https://wiki.hyprland.org/Configuring/Monitors/
monitor=eDP-1, 1920x1080@144, 0x0, 1
monitor=HDMI-A-1, 1920x1080@100, 1920x0, 1, transform, 1

# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Execute your favorite apps at launch
# exec-once = waybar & hyprpaper & firefox

# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf

# Some default env vars.
env = XCURSOR_SIZE,24
env = HYPRCURSOR,24

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = us,ru
    kb_variant =
    kb_model =
    kb_options=grp:alt_shift_toggle
    kb_rules =

    follow_mouse = 1

    touchpad {
        natural_scroll = no
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}


general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 0
    gaps_out = 0
    border_size = 1

    col.active_border = rgba(ca9ee6ff) rgba(f2d5cfff) 45deg
    layout = dwindle
    resize_on_border = true
}

decoration {
    rounding = 0

    blur {
        enabled = yes
        size = 6
        passes = 3
        new_optimizations = on
        ignore_opacity = on
        xray = false
    }
}

layerrule = blur,aybar


# █░░ ▄▀█ █▄█ █▀▀ █▀█   █▀█ █░█ █░░ █▀▀ █▀
# █▄▄ █▀█ ░█░ ██▄ █▀▄   █▀▄ █▄█ █▄▄ ██▄ ▄█

layerrule = blur,rofi
layerrule = ignorezero,rofi
layerrule = blur,notifications
layerrule = ignorezero,notifications
layerrule = blur,swaync-notification-window
layerrule = ignorezero,swaync-notification-window
layerrule = blur,swaync-control-center
layerrule = ignorezero,swaync-control-center
layerrule = blur,logout_dialog

xwayland {
  force_zero_scaling = true
}

animations {
    enabled = no
    bezier = wind, 0.05, 0.9, 0.1, 1.05
    bezier = winIn, 0.1, 1.1, 0.1, 1.1
    bezier = winOut, 0.3, -0.3, 0, 1
    bezier = liner, 1, 1, 1, 1
    animation = windows, 1, 6, wind, slide
    animation = windowsIn, 1, 6, winIn, slide
    animation = windowsOut, 1, 5, winOut, slide
    animation = windowsMove, 1, 5, wind, slide
    animation = border, 1, 1, liner
    animation = borderangle, 1, 30, liner, loop
    animation = fade, 1, 10, default
    animation = workspaces, 1, 5, wind
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = off
}

misc {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    force_default_wallpaper = -1 # Set to 0 to disable the anime mascot wallpapers
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more

# Example windowrule v1
# windowrule = float, ^(kitty)$
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, Return, exec, kitty
bind = $mainMod, C, killactive,
bind = $mainMod, M, exit,
bind = $mainMod, E, exec, kitty ranger
bind = $mainMod, V, togglefloating,
bind = $mainMod, R, exec, rofi -show run
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, ;, togglesplit, # dwindle

# Move focus with mainMod + arrow keys
bind = $mainMod, H, movefocus, l
bind = $mainMod, L, movefocus, r
bind = $mainMod, K, movefocus, u
bind = $mainMod, J, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10


# Example special workspace (scratchpad)
bind = $mainMod, S, togglespecialworkspace, magic
bind = $mainMod SHIFT, S, movetoworkspace, special:magic

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# My own Binds
bind = $mainMod, Print, exec, grim -g "$(slurp)"
bind = $mainMod, F1, exec, firefox
bind = $mainMod, F2, exec, telegram-desktop
bind = $mainMod, F3, exec, logseq
bind = $mainMod, F4, exec, zathura
bind = $mainMod, Q, exec, hyprlock
binde =, XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
binde =, XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%


# Exec once
exec-once = hyprpaper
exec-once = hyprlock -c /etc/hypr/hyprlock.conf
binde =, XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%
binde = , XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
binde = , XF86MonBrightnessUp, exec, brightnessctl set 5%+
binde = , XF86MonBrightnessDown, exec, brightnessctl set 5%-
bind = $mainMod, PRINT, exec, hyprshot -m region


# Exec once
exec-once = hyprpaper
exec-once = ciadpi --ip 127.0.0.1 --port 1080 --disorder 1 --auto=torst --tlsrec 1+s
exec-once = hypridle
exec-once = dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita'"
exec-once = waybar

'';
  };
}
