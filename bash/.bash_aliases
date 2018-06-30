function ins()
{
    dpkg -l | grep '^ii' | grep $1 | less
}
function aps()
{
    apt search $1 | less
}
function wifi()
{
    sudo wpa_supplicant -B -c /etc/wpa_supplicant_home.conf -i wlp2s0 -Dwext
    sudo dhclient wlp2s0
}
