xrandr --dpi 192
export GDK_SCALE=2
while true; do
	let batt=$(cat /sys/class/power_supply/BAT0/charge_now)\*100/$(cat /sys/class/power_supply/BAT0/charge_full)
	batt_state=$(cat /sys/class/power_supply/BAT0/status)
	xsetroot -name " [ TIME: $(date +'%a %b %d %H:%M') | BATT: $batt % $batt_state ]"
	sleep 1
done &
xrdb ~/.Xresources
gentoo-pipewire-launcher &
nitrogen --restore
exec dbus-launch --sh-syntax --exit-with-session dwm

