# Add some paths to PATH if available
for dir in $HOME/usr/bin \
           $HOME/bin
do   if [ -d $dir ]
     then export PATH=$PATH:$dir
     fi
done

# temporarily generate directory and chdir (requires pwgen)
alias tmpdir='tmpdir=/tmp/`pwgen`; mkdir $tmpdir; cd $tmpdir'

# Used for prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

PS1='${debian_chroot:+($debian_chroot)}\u:\w$(__git_ps1 "[%s$(parse_git_dirty)]")\$ '
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 "[\[\e[0;32m\]%s\[\e[0m\]\[\e[0;33m\]$(parse_git_dirty)\[\e[0m\]]")\$ '