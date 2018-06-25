function ins()
{
    dpkg -l | grep '^ii' | grep $1 | less
}
function aps()
{
    apt search $1 | less
}
