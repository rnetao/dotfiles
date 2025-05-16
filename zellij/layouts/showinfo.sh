#!/bin/bash

# ANSI color helpers
sep() { printf "\e[48;2;$1;$2;$3m\e[38;2;$4;$5;$6m"; }
block() { printf "\e[48;2;$1;$2;$3m\e[38;2;$4;$5;$6m%s" "$7"; }

# Metrics
uptime=$(uptime | awk '{for(i=1;i<=NF;i++) if($i=="up") {t=$(i+1); gsub(/,/,"",t); split(t,a,":"); print a[1]"h "a[2]"m"; exit}}')
disk_free=$(df -h / | awk 'NR==2{print $4}')
disk_used_perc=$(df -h / | awk 'NR==2{print $5}')
loadavg=$(uptime | awk -F'load averages?: ' '{print $2}' | cut -d' ' -f1)
mem_total=$(sysctl -n hw.memsize | awk '{printf "%.0f", $1 / 1073741824}')
mem_used=$(vm_stat | awk '/Pages active:/ {active=$3} /Pages wired down:/ {wired=$4} END {printf "%.2f", ((active + wired) * 4096) / 1073741824}')
mem_perc=$(awk -v used="$mem_used" -v total="$mem_total" 'BEGIN {printf "%d", used / total * 100}')


battery=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)

# Styled output
sep 122 168 159 24 24 37
block 122 168 159 0 0 0 "$uptime"
sep 152 187 108 122 168 159
block 152 187 108 0 0 0 "$disk_free $disk_used_perc"
sep 126 156 216 152 187 108
block 126 156 216 0 0 0 "$loadavg"
sep 156 134 191 126 156 216
block 156 134 191 0 0 0 "${mem_used}G ${mem_total}G $mem_perc%"
sep 255 204 0 156 134 191
block 255 204 0 0 0 0 "󰁹${battery}%"
sep 220 215 186 255 204 0
