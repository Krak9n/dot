#!/usr/bin/fish

set network_name $argv[1]
if test (count $argv) -lt 1
    echo "Usage: doh-register-client.fish <network name>"
    exit 1
end

nmcli connection modify $network_name ipv4.dns "127.0.0.1"
nmcli connection modify $network_name ipv4.ignore-auto-dns yes
nmcli connection modify $network_name ipv6.ignore-auto-dns yes
sudo systemctl restart NetworkManager.service
sudo systemctl status doh-client.service | grep "Active:" 
