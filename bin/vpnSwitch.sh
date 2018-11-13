#!/bin/sh

for s in "il6" "il11" "uk404" "us1189" "nl-tor1" "il6-tcp" "il8" "uk313"; do
    service="openvpn-client@"$s".service"
    if [ "$(systemctl is-active $service)" = "active" ]; then
        rVPN=$s         
    fi
done

echo "Currently connected to $rVPN"

function stop () {
    if [ "$rVPN" != "$1" ]; then
        echo "Stopping $rVPN"
        systemctl stop openvpn-client@$rVPN.service
        echo "Starting $1"
        systemctl start openvpn-client@$1.service
    else
        echo "This service is already running!"
        systemctl restart openvpn-client@$1.service
        echo "Restarting..."
    fi
}       

case "$1" in
    israel)
        stop "il6"
    ;;
    israel8)
        stop "il8"
    ;;
    tcp)
        stop "il6-tcp"
    ;;
    torrent)
        stop "il11"
    ;;
    uk) 
        stop "uk404"
    ;;
    usa) 
        stop "us1189"
    ;;
    tor) 
        stop "nl-tor1"
    ;;
    uk2) 
        stop "uk313"
    ;;
    *)
        echo "Didn't match anything"
    ;;
esac
