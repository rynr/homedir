
# Add some paths to PATH if available
for dir in $HOME/usr/bin \
           $HOME/bin
do   if [ -d $dir ]
     then export PATH=$PATH:$dir
     fi
done

# temporarily generate directory and chdir (requires pwgen)
alias tmpdir='tmpdir=/tmp/`pwgen`; mkdir $tmpdir; cd $tmpdir'
