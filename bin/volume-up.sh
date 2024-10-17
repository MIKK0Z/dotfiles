if [ -z $1 ]; then
    echo "Usage: volume-up.sh <percentage>"
    exit 1
fi

current_volume= get-sink-volume 0

pactl set-sink-volume 0 +$1%