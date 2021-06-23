#while true
#do
#    curl "wttr.in?format=1" > /tmp/currWeather.tmp
#    sleep 1h
#done &
#
#while true
#do
#    TEMPO=$(< /tmp/currWeather.tmp)
#    CPU=$(top -bn1 | grep "Cpu(s)" | \
#      sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
#      awk '{printf("%02d%\n",100 - $1)}')
#    DISCO=$(df -h /dev/nvme0n1p2 | awk 'NR==2{print $3}')
#    MEM=$(free -h | awk '(NR==2){ print $3 }')
#    DATA=$(date '+%A %e, %B')
#    HORA=$(date +%H:%M)
#    xsetroot -name " ${TEMPO} |  ${CPU} |  ${DISCO} |  ${MEM} |  ${DATA} |  ${HORA} "
#    sleep 2s
#done &
exec slstatus &
