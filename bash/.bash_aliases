function ins()
{
    apt list --installed | grep $1 | less
}
function aps()
{
    apt search $1 | less
}
alias rw="sed --follow-symlinks -i 's/[[:space:]]*$//'"
alias binstall='make && make install PREFIX=$HOME'
alias neofetch='neofetch --ascii_distro ubuntu_old'
function mcd()
{
    [ ! -f "$1" ] && mkdir $1
    cd $1
}
