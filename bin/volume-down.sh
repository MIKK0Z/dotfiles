if [ -z $1 ]; then
    echo "Usage: volume-down.sh <percentage>"
    exit 1
fi

pactl set-sink-volume 0 -$1%