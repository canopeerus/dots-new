function ins()
{
    apt list --installed | grep "$1" | less
}
function aps()
{
    apt search $1 | less
}
alias rw="sed --follow-symlinks -i 's/[[:space:]]*$//'"
alias binstall='make && make install PREFIX=$HOME'
function mcd()
{
    [ ! -f "$1" ] && mkdir $1
    cd $1
}

function rgheader()
{
    rg -R $1 /usr/include/
    rg -R $1 /usr/local/include/*
}
alias gc='git clone'
alias pget='sudo apt install'
alias prem='sudo apt remove --purge'
if grep -i "ubuntu" /etc/os-release 1>/dev/null; then
    alias neofetch="neofetch --ascii_distro ubuntu_old"
fi
alias devrun="ENV=prod flask run"
