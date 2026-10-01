#!/usr/bin/env bash
# Power draw for the tmux status bar: CPU package + DRAM (RAPL) + amdgpu.
# Board/drives/fans/PSU loss have no sensor, so wall draw is higher.
# RAPL energy_uj is root-only by default; see etc/tmpfiles.d/rapl.conf.

state=${XDG_RUNTIME_DIR:-/tmp}/tmux-power
now_t=$(date +%s%N)
declare -A prev
[[ -r $state ]] && while read -r k e t; do prev[$k]="$e $t"; done <"$state"
: >"$state"

# rapl <powercap dir> <key>: average watts since the previous call
rapl() {
    local dir=$1 key=$2 e pe pt de dt
    [[ -r $dir/energy_uj ]] || return 1
    e=$(<"$dir/energy_uj")
    echo "$key $e $now_t" >>"$state"
    [[ -n ${prev[$key]} ]] || return 1
    read -r pe pt <<<"${prev[$key]}"
    de=$((e - pe))
    dt=$((now_t - pt))
    # counter wraps at max_energy_range_uj
    ((de < 0)) && de=$((de + $(<"$dir/max_energy_range_uj")))
    ((dt > 0)) && echo $((de * 1000 / dt))
}

parts=() total=0
add() { [[ -n $2 ]] && parts+=("$1$2") && total=$((total + $2)); }

for d in /sys/class/powercap/intel-rapl:*; do
    case $(<"$d/name") in
        package-*) add C "$(rapl "$d" cpu)" ;;
        dram) add R "$(rapl "$d" ram)" ;;
    esac
done

for h in /sys/class/hwmon/hwmon*; do
    [[ $(<"$h/name") == amdgpu && -r $h/power1_input ]] &&
        add G $(($(<"$h/power1_input") / 1000000))
done

((${#parts[@]})) && echo "⚡${total}W"
