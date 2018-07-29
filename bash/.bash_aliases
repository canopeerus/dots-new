function ins()
{
    rpm -qa | grep -i $1 | less
}
function aps()
{
    zypper search $1 | less
}
alias remove_whitespace="sed -i 's/[[:space:]]*$//'"
