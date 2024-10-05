#!/bin/sh

CHOSEN=$(printf "Connect\nRescan\nEdit" | tofi -c "$HOME"/.config/tofi/small-config)

connect() {
    AVAILABLE_NETWORKS=$(nmcli device wifi list | tail -n +2 | tr "*" "@")

    echo $AVAILABLE_NETWORKS

    return

    declare -a PARSED_NETWORKS

    line_counter=0
    network_counter=0

    for network_part in $AVAILABLE_NETWORKS; do
        # echo "$line_counter, $network_counter:  $network_part"

        if [ $network_part = "@" ]; then
            line_counter=$((line_counter-1))
        fi

        if [ $network_part = "802.1X" ]; then
            line_counter=$((line_counter-1))
        fi

        if [ $line_counter = 1 ]; then
            PARSED_NETWORKS[network_counter]=$network_part
        fi

        if [ $line_counter = 9 ]; then
            line_counter=0
            network_counter=$((network_counter+1))
        fi

        line_counter=$((line_counter+1))
    done

    IFS=$'\n';
    echo "${PARSED_NETWORKS[*]}" | tofi

    # printf $PARSED_NETWORKS | tofi
}

rescan() {
    nmcli device wifi rescan
}

edit() {
    echo "e"
}

case "$CHOSEN" in
    "Connect") connect ;;
    "Rescan") rescan ;;
    "Edit") edit ;;
    * ) exit 1 ;;
esac
