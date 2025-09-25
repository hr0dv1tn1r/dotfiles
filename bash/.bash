# ====================================================================
# CONFIGURAÇÃO UNIVERSAL BASH - CARREGADO VIA STOW
# Contém apenas comandos compatíveis com BASH e essenciais para o ambiente
# ====================================================================

# === Variáveis de Ambiente Essenciais ===
export EDITOR='nvim'
export SUDO_EDITOR="$EDITOR"

# === CONSTRUÇÃO DO PATH ===
# Adiciona todos os caminhos personalizados ao INÍCIO do PATH para prioridade.

# 1. Bins e scripts do usuário (maior prioridade)
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# 2. Ferramentas instaladas manualmente ou em locais específicos (Neovim/Tmuxifier)
export PATH="/opt/nvim/bin:$PATH"             # Neovim Binário
export PATH="$HOME/.tmuxifier/bin:$PATH"      # Tmuxifier Binários
export PATH="$HOME/.local/share/nvim/mason/bin/:$PATH" # Mason Nvim Plugin

# 3. Kits de Desenvolvimento (SDKs)
export PATH="$HOME/Android/Sdk/platform-tools:$PATH"

# === Inicialização do SSH Agent e Credenciais (GNOME KEYRING) ===
# Inicia o gnome-keyring-daemon para o Git Credential Manager, se não estiver rodando.
# Verifica se o controle já existe e se o DBUS está pronto.
if [ -z "$GNOME_KEYRING_CONTROL" ] && [ -n "$DBUS_SESSION_BUS_ADDRESS" ]; then
    /usr/bin/gnome-keyring-daemon --start --components=secrets 2>/dev/null
fi

# === Gerenciadores de Versão (Inicialização Condicional) ===
# Verifica se os arquivos de inicialização existem antes de tentar carregá-los,
# prevenindo o erro 'command not found'.

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Jenv (Java Environment Manager)
if command -v jenv &> /dev/null; then
    eval "$(jenv init -)"
fi

# SDKMAN
if [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
