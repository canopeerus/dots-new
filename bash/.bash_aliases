function ins()
{
    dpkg -l | grep ii | grep -i $1 | less
}
function zps()
{
    apt search $1 | less
}
alias remove_whitespace="sed --follow-symlinks -i 's/[[:space:]]*$//'"
