local nvm_file="/usr/share/nvm/init-nvm.sh"
if [[ -f $nvm_file && -r $nvm_file ]] then
    source $nvm_file
fi
