(( ${+plugins} )) || plugins=()
() {
    plugins+=( 
	    extract
        z
        fzf
        sudo
    )
    add_plugin(){
        local name="$1"
        local plugin_dir="$ZSH_CUSTOM/plugins/$name"

        # 目录存在且非空（submodule 已拉取）
        if [[ -d "$plugin_dir" && -n "$(ls -A "$plugin_dir" 2>/dev/null)" ]]; then
           plugins+=($name)
        fi
    }
    add_plugin "zsh-autosuggestions"
    add_plugin "zsh-syntax-highlighting"
} "$@"

