{ pkgs, ... }:

pkgs.writeShellScriptBin "cloudflare" ''
  if warp-cli status | grep -q 'Disconnected'; then
    warp-cli connect > /dev/null 2>&1
    echo "{\"class\": \"active\", \"tooltip\": \"connected\"}"
  else
    warp-cli disconnect > /dev/null 2>&1
    echo "{\"tooltip\": \"disconnected\"}"
  fi
''
