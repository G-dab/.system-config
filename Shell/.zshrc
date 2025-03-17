
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    z
    extract
    web-search
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
 
# ==================
# Proxy
# ==================
# Ubuntu
proxy () {
  export ALL_PROXY="socks5://127.0.0.1:1089"
  export all_proxy="socks5://127.0.0.1:1089"
}

unproxy () {
  unset ALL_PROXY
  unset all_proxy
}

# WSL2
host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")

wsl_proxy () {
  export ALL_PROXY="http://$host_ip:10811"
  export all_proxy="http://$host_ip:10811"
 # echo -e "Acquire::http::Proxy \"http://$host_ip:10811\";" | sudo tee -a /etc/apt/apt.conf > /dev/null
 # echo -e "Acquire::https::Proxy \"http://$host_ip:10811\";" | sudo tee -a /etc/apt/apt.conf > /dev/null
}

# ==================
# User configuration
# ==================
# Esc-Esc for sudo
bindkey -s '\e\e' '\C-asudo \C-e'

# alias
alias c="clear"
alias v="vim"