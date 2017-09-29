# This file has been written by xornand.
# edit it as you like.
#

# i3 config file (v4)
#
# Please see http://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4

#colors from script pywal

set_from_resource $bright i3wm.color2 #ff0000
#set_from_resource $bg i3wm.color7 #ff0000
set_from_resource $light i3wm.color9 #ff0000
set_from_resource $fg i3wm.color5 #ff0000
set_from_resource $bg i3wm.color3 #ff0000

# start i3 bar
exec polybar example

	# custom color scheme inspired by the ARC-DARK theme
	set $bg-color			#000000
	set $inactive-bg-color		#2f343f
	set $text-color			#FFFFFF
	set $inactive-text-color	#676E7D
	set $urgent-bg-color		#E53935
	set $bordercolor			#c5cbd6
	set $bg-highlight			#556177

	# window			border			background			text				indicator
	client.focused		$bg				$bg-color			$text-color			$fg			$fg
	client.unfocused		$light			$inactive-bg-color	$inactive-text-color	$light		$light
	client.focused_inactive	$light			$inactive-bg-color	$inactive-text-color	$light		$light
	client.urgent		$strong			$urgent-bg-color		$text-color			$strong		$strong

# resize window
mode "resize" {

	# ijkl keys
	bindsym j resize shrink width 5 px or 5 ppt
	bindsym k resize grow height 5 px or 5 ppt
	bindsym i resize shrink height 5 px or 5 ppt
	bindsym l resize grow width 5 px or 5 ppt

	# IJKL keys
	bindsym shift j resize shrink width 20 px or 20 ppt
	bindsym shift k resize grow height 20 px or 20 ppt
	bindsym shift i resize shrink height 20 px or 20 ppt
	bindsym shift l resize grow width 20 px or 20 ppt

	# arrow keys
	bindsym Left resize shrink width 5 px or 5 ppt
	bindsym Down resize grow height 5 px or 5 ppt
	bindsym Up resize shrink height 5 px or 5 ppt
	bindsym Right resize grow width 5 px or 5 ppt

	# shift arrow keys
	bindsym shift Left resize shrink width 20 px or 20 ppt
	bindsym shift Down resize grow height 20 px or 20 ppt
	bindsym shift Up resize shrink height 20 px or 20 ppt
	bindsym shift Right resize grow width 20 px or 20 ppt

	# back : Enter or Escape
	bindsym Return mode "default"
	bindsym Escape mode "default"
	}

# media player
mode "player" {

	bindsym p exec pavucontrol

	# Media player controls
	bindsym i exec playerctl play-pause
	bindsym k exec playerctl pause
	bindsym l exec playerctl next
	bindsym j exec playerctl previous

	# volume control
	bindsym u exec --no-startup-id pactl set-sink-volume 0 -5%
	bindsym o exec --no-startup-id pactl set-sink-volume 0 +5%
	# mute sound
	bindsym m exec --no-startup-id pactl set-sink-mute 0 toggle

	# enter : back, escape : reset
	bindsym Return mode "default"
	bindsym Escape mode "default"
	}

# resize gaps
mode "borders" {

	# ijkl keys
	bindsym i gaps inner all plus 5
	bindsym k gaps inner all minus 5
	bindsym l gaps outer all plus 5
	bindsym j gaps outer all minus 5

	# custom profiles 1,2,3,4
	bindsym 1 gaps inner all set 0; gaps outer all set 0
	bindsym 2 gaps inner all set 5; gaps outer all set 0
	bindsym 3 gaps inner all set 5; gaps outer all set 5
	bindsym 4 gaps inner all set 10; gaps outer all set 0
	bindsym 5 gaps inner all set 10; gaps outer all set 5
	bindsym 6 gaps inner all set 30; gaps outer all set 15
	bindsym 7 gaps inner all set 60; gaps outer all set 30

	# enter : back, escape : reset
	bindsym Return mode "default"
	bindsym Escape mode "default"; gaps inner all set 10; gaps outer all set 5
	}

mode "Layout Us or International" {

	bindsym u exec setxkbmap us ; mode "default"
	bindsym i exec setxkbmap us intl ; mode "default"

	# enter : back, escape : reset
	bindsym Return mode "default"
	bindsym Escape mode "default"
	}


# window border size
new_window pixel 2
new_float pixel 2

# default font
font -misc-tamsyn-medium-r-normal--14-101-100-100-c-70-iso8859-1

# no edges
#hide_edge_borders both

# thin default gaps
gaps inner 10
gaps outer 5

####
#### bindings sticky
####

## mode binders

# resize window
bindsym $mod r mode "resize"

# open presets
bindsym $mod g mode "templates"

# resize borders
bindsym $mod b mode "borders"

# swap layout
bindsym $mod y mode "Layout Us or International"

# media player
bindsym $mod p mode "player"

# kill focused
bindsym $mod q kill

# floating mover key
floating_modifier $mod

# change focus jkil
bindsym $mod j focus left
bindsym $mod k focus down
bindsym $mod i focus up
bindsym $mod l focus right

# change focus cursor keys
bindsym $mod Left focus left
bindsym $mod Down focus down
bindsym $mod Up focus up
bindsym $mod Right focus right

# move focused window jkil
bindsym $mod Shift j move left
bindsym $mod Shift k move down
bindsym $mod Shift i move up
bindsym $mod Shift l move right

# move focused window cursor keys
bindsym $mod Shift Left move left
bindsym $mod Shift Down move down
bindsym $mod Shift Up move up
bindsym $mod Shift Right move right

# split horizontal
bindsym $mod h split h

# split vertical
bindsym $mod v split v

# enter fullscreen mode focused
bindsym $mod f fullscreen toggle

# change container layout stacked, tabbed, toggle split
bindsym $mod s layout stacking
bindsym $mod w layout tabbed
bindsym $mod e layout toggle split

# toggle tiling / floating
bindsym $mod Shift space floating toggle

# change focus between tiling floating
bindsym $mod space focus mode_toggle

# the configuration file
bindsym $mod Shift r reload

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod Shift q restart

# exit i3 (logs out X session)
bindsym $mod Shift w exec "i3-nagbar -t warning -m 'AGOODBYE' -b 'Goodbye xor' 'i3-msg exit' -f 'Noto Mono'"

# switch to workspace
set $works1 "1 "
set $works2 "2 "
set $works3 "3 "
set $works4 "4 "
set $works5 "5 "
set $works6 "6 "
set $works7 "7 "
set $works8 "8 "
set $works9 "9 "
set $works10 "0 "

# switch to workspace
bindsym $mod 1 workspace $works1
bindsym $mod 2 workspace $works2
bindsym $mod 3 workspace $works3
bindsym $mod 4 workspace $works4
bindsym $mod 5 workspace $works5
bindsym $mod 6 workspace $works6
bindsym $mod 7 workspace $works7
bindsym $mod 8 workspace $works8
bindsym $mod 9 workspace $works9
bindsym $mod 0 workspace $works10

# move focused container to workspace
bindsym $mod Shift 1 move container to workspace $works1
bindsym $mod Shift 2 move container to workspace $works2
bindsym $mod Shift 3 move container to workspace $works3
bindsym $mod Shift 4 move container to workspace $works4
bindsym $mod Shift 5 move container to workspace $works5
bindsym $mod Shift 6 move container to workspace $works6
bindsym $mod Shift 7 move container to workspace $works7
bindsym $mod Shift 8 move container to workspace $works8
bindsym $mod Shift 9 move container to workspace $works9
bindsym $mod Shift 0 move container to workspace $works10

####
#### bindings for settings
####

# start terminal
bindsym $mod Return exec urxvt

# start Rofi program launcher
bindsym $mod d exec rofi -show run -hide-scrollbar -bw 1 -lines 4 -eh 1 -font "Noto Mono 11"

# take a screenshot
bindsym $mod z exec scrot -b 'screen_%Y-%m-%d--%H:%M:%S.png' -e 'mv $f /home/tommaso/pics/screenshots/'

# take a screenshot of selection
bindsym --release $mod shift z exec scrot -s -b 'screen_%Y-%m-%d--%H:%M:%S.png' -e 'mv $f /home/tommaso/pics/screenshots/'

# lock with custom locker
bindsym $mod Escape exec lock

#### bindings for installed apps

# firefox
bindsym $mod Shift f exec firefox

# atom
bindsym $mod Shift a exec atom

# file manager
bindsym $mod t exec urxvt -e ranger
bindsym $mod Shift t exec thunar

# pavucontrol
bindsym $mod Shift p exec pavucontrol

# tweak tool lxappearance
bindsym $mod Shift x exec lxappearance

# double telegram account
bindsym $mod u exec ~/Downloads/Telegram/Telegram --class TelegramDesktop
#bindsym $mod Shift u exec telegram -many -workdir ~/Downloads/Telegram\ Nand

# screenrec
bindsym $mod c exec kazam

####
#### system controls
####

## Pulse Audio controls

#increase sound volume
bindsym $mod Shift n exec --no-startup-id pactl set-sink-volume 0 +5%

#decrease sound volume
bindsym $mod Shift b exec --no-startup-id pactl set-sink-volume 0 -5%

# mute sound
bindsym $mod m exec --no-startup-id pactl set-sink-mute 0 toggle

## sreen brightness controls

# increase screen brightness
bindsym  $mod Shift v exec light -A 5

# decrease screen brightness
bindsym $mod Shift c exec light -U 5

####
#### startup running apps
####

# transparence rendering
exec compton -f

# USB drives manager and mounter
exec --no-startup-id udiskie

# set wallpaper
exec_always wal -R

# setup monitors
#exec_always xrandr --output HDMI2 --off --output HDMI1 --off --output DP1 --mode 1280x1024 --pos 1920x0 --rotate normal --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off

# network manager applet
exec nm-applet

# conky resource visualizer
exec conky

# for my logitech mouse
exec solaar

exec xset -b

# spotify
bindsym $mod shift s workspace " S "; exec spotify

#exec_always polybar top

for_window [class="Pavucontrol"] floating enable
for_window [class="Lxappearance"] floating enable
for_window [class="Solaar"]  floating enable
for_window [class="TelegramDesktop"]  floating enable, floating_maximum_size 900 x 980
for_window [class="Toplevel"]  floating enable
