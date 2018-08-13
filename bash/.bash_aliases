function ins()
{
    rpm -qa | grep -i $1 | less
}
function zps()
{
    zypper search $1 | less
}
alias remove_whitespace="sed --follow-symlinks -i 's/[[:space:]]*$//'"
