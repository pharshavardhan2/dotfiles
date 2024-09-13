{ pkgs }:

pkgs.writeShellScriptBin "brightness" ''
  # Use brightnessctl to naturally adjust laptop screen brightness and send a notification

  send_notification() {
  	brightness=$(brightnessctl -m | cut -d, -f4 | sed 's/%//')
  	notify-send -a "Backlight" -u low -r 9994 -h int:value:"$brightness" -i "brightness" "Brightness" "Currently at $brightness%" -t 1000
  }

  case $1 in
  	up)
  		brightnessctl -e4 set 5%+
  		send_notification
  		;;
  	down)
  		brightnessctl -e4 set 5%-
  		send_notification
  		;;
  esac
''
