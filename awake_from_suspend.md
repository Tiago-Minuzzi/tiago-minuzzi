# Fix suspend/resume freeze

## In /etc/UPower/UPower.conf
- IgnoreLid=false -> true

## In /etc/systemd/logind.conf
- HandleLidSwitch=suspend -> ignore
- HandleLidSwitchExternalPower=suspend -> ignore
