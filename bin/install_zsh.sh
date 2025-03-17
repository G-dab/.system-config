#!/bin/zsh

set -e
# # 安装 Zsh
# if ! command -v zsh &> /dev/null; then
#     echo "zsh 未安装，正在安装..."

#     # 检测系统类型并安装 zsh
#     if [[ -f /etc/debian_version ]]; then
#         # Debian/Ubuntu 系统
#         sudo apt update && sudo apt install -y zsh
#     fi

#     if [[ $? -eq 0 ]]; then
#         echo "zsh 安装成功！"
#     else
#         echo "zsh 安装失败，请检查权限或网络连接。"
#         exit 1
#     fi
# fi

# # 切换为 Zsh
# chsh -s "$(which zsh)"
# # exec zsh 

# # 安装 Oh-my-zsh
# sh ~/.system-config/bin/install_oh_my_zsh.sh

# back up .zshrc
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bak
fi
cp ~/.system-config/Shell/.zshrc ~

# Oh-my-zsh plugins
POWERLEVEL10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
ZSH_AUTOSUGGESTIONS_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
ZSH_SYNTAX_HIGHLIGHTING_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

if [ ! -d "$POWERLEVEL10K_DIR" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
    echo "Powerlevel10k already exists. Skipping clone."
fi

if [ ! -d "$ZSH_AUTOSUGGESTIONS_DIR" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_AUTOSUGGESTIONS_DIR"
else
    echo "zsh-autosuggestions already exists. Skipping clone."
fi

if [ ! -d "$ZSH_SYNTAX_HIGHLIGHTING_DIR" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_SYNTAX_HIGHLIGHTING_DIR"
else
    echo "zsh-syntax-highlighting already exists. Skipping clone."
fi

source ~/.zshrc