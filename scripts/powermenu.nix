{ pkgs, ... }:

pkgs.writeShellScriptBin "powermenu" ''
  # Power menu script using tofi

  CHOSEN=$(printf "Lock\nSuspend\nReboot\nShutdown\nLog Out" | tofi)

  case "$CHOSEN" in
  	"Lock") playerctl pause; loginctl lock-session ;;
  	"Suspend") systemctl suspend-then-hibernate ;;
  	"Reboot") systemctl reboot ;;
  	"Shutdown") systemctl poweroff ;;
  	"Log Out") loginctl terminate-user $USER ;;
  	*) exit 1 ;;
  esac
''
