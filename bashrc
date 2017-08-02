export EDITOR=vim

# Add some paths to PATH if available
for dir in $HOME/usr/bin \
           $HOME/bin
do   if [ -d $dir ]
     then export PATH=$PATH:$dir
     fi
done

# temporarily generate directory and chdir (requires pwgen)
alias tmpdir='tmpdir=/tmp/`pwgen`; mkdir $tmpdir; cd $tmpdir'

set_prompt()
{
   local last_cmd=$?
   local txtreset='$(tput sgr0)'
   local txtbold='$(tput bold)'
   local txtblack='$(tput setaf 0)'
   local txtred='$(tput setaf 1)'
   local txtgreen='$(tput setaf 2)'
   local txtyellow='$(tput setaf 3)'
   local txtblue='$(tput setaf 4)'
   local txtpurple='$(tput setaf 5)'
   local txtcyan='$(tput setaf 6)'
   local txtwhite='$(tput setaf 7)'
   # unicode "✗"
   local fancyx='\342\234\227'
   # unicode "✓"
   local checkmark='\342\234\223'
   # Line 1: Full date + full time (24h)
   # Line 2: current path
   PS1="\[$txtbold\]\[$txtblue\]\D{%H:%M} "
   # User color: red for root, yellow for others
   if [[ $EUID == 0 ]]; then
       PS1+="\[$txtred\]"
   else
       PS1+="\[$txtyellow\]"
   fi
   # Line 3: user@host
   PS1+="\u\[$txtwhite\]:"
   PS1+="\[$txtgreen\]\w "
   # Line 4: a red "✗" or a green "✓" and the error number
   if [[ $last_cmd == 0 ]]; then
      PS1+="\[$txtgreen\]$checkmark\[$txtwhite\] "
   else
      PS1+="\[$txtred\]$fancyx\[$txtwhite\] "
   fi
   # Line 4: green git branch
   PS1+="\[$txtgreen\]$(__git_ps1 '(%s) ')\[$txtwhite\]"
   # Line 4: good old prompt, $ for user, # for root
   PS1+="\\$\[$txtreset\] "
}
PROMPT_COMMAND='set_prompt'
