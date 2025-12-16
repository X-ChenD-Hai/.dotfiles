if command -v 'nvim' &>/dev/null; then 
    export EDITOR='nvim'
elif command -v "vim"; then
    export EDITOR='vim'
fi
