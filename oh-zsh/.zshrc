export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"


(( ${+ZSH_CUSTOM} )) || ZSH_CUSTOM="$HOME/.config/omz-custom"

plugins=(
	git
)

ZSH_CONFIG_DIR="$HOME/.config/zsh"
if [[ -d "$ZSH_CONFIG_DIR" ]] then 
	for file in $(ls "$ZSH_CONFIG_DIR"/*.zsh); do
		[[ -f "$file" && -r "$file" ]] && source "$file"
	done
fi

typeset -gaU plugins


source $ZSH/oh-my-zsh.sh


export LS_COLORS=$(echo $LS_COLORS | sed "s/tw=30;42/tw=34/g" | sed "s/ow=34;42/ow=34/g" | sed "s/st=37;44/st=37/g")
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
