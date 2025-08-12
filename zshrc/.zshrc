# Last updated: 12 de Agosto de 2025

# === CONSTRUÇÃO DO PATH (Método Zsh Moderno) ===
# A diretiva 'typeset -U' garante que todos os caminhos sejam únicos.
typeset -U path

# 1. Bins e scripts do usuário (maior prioridade)
path=("$HOME/.local/bin" "$HOME/bin" $path)

# 2. Ferramentas instaladas manualmente ou em locais específicos
path=("/opt/nvim/bin" $path)             # Neovim (se instalado manualmente via AppImage, etc.)
path=("$HOME/.tmuxifier/bin" $path)       # Tmuxifier

# 3. Kits de Desenvolvimento (SDKs)
path=("$HOME/Android/Sdk/platform-tools" $path) # Ferramentas de plataforma do Android SDK

# === Variáveis de Ambiente Essenciais ===
export EDITOR='nvim'
export SUDO_EDITOR="$EDITOR"


# === Oh My Zsh ===
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  git
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)
# A inicialização do Oh My Zsh deve vir depois da configuração inicial do PATH
source $ZSH/oh-my-zsh.sh


# === Aliases e Funções ===
# Exemplo: alias ll='ls -lhaF'


# === Configuração do Histórico do Shell ===
HISTFILE=~/.zshrc_history
HISTSIZE=10000
SAVEHIST=50000


# === Gerenciadores de Versão e Ferramentas Finais ===
# Estas ferramentas manipulam o PATH e o ambiente, por isso geralmente vêm por último.

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Jenv (Java Environment Manager)
export PATH="$HOME/.jenv/bin:$PATH" # Jenv exige essa exportação explícita
eval "$(jenv init -)"

# SDKMAN
# Esta seção deve ser mantida no final, conforme a documentação do SDKMAN.
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
