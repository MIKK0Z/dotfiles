if [ -z $1 ]; then
    echo "Usage: volume-up.sh <percentage>"
    exit 1
fi

current_volume="$(pactl get-sink-volume 0 | cut -f2 -d'/' | cut -b2,3,4)"
new_volume=$((current_volume + $1))

if [ $new_volume -gt 100 ]; then
    new_volume=100
fi


pactl set-sink-volume 0 $new_volume%