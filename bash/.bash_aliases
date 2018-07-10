function ins()
{
    rpm -qa | grep $1 | less
}
function aps()
{
    zypper search $1 | less
}
