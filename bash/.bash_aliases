function ins()
{
    dpkg -l | grep ii | grep -i $1 | less
}
function aps()
{
    apt search $1 | less
}
alias remove_whitespace="sed --follow-symlinks -i 's/[[:space:]]*$//'"
alias neofetch='neofetch --ascii_distro ubuntu_old'
alias binstall='make && make install PREFIX=$HOME'
