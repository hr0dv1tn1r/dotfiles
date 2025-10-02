#!/bin/bash

# ====================================================================
# SCRIPT DE SETUP PARA DOTFILES (FINAL E CORRIGIDO)
# ====================================================================

# 1. Instalação de Ferramentas Essenciais e Fontes
echo "--- 1. Instalando Dependências (Git, Stow, Zsh, Tmux, etc.) e Fontes ---"
sudo apt update
sudo apt install -y git wget curl vim build-essential stow zsh tmux unzip fontconfig ripgrep

# Prepara o diretório de instalação per-usuário para fontes
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

# Baixa e descompacta a fonte para o diretório de fontes
TEMP_ZIP=$(mktemp)
echo "Baixando JetBrains Mono Nerd Font..."
curl -fLo "$TEMP_ZIP" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"

unzip -o "$TEMP_ZIP" -d "$FONT_DIR"
rm "$TEMP_ZIP"

# Atualiza o cache de fontes
echo "Atualizando cache de fontes..."
fc-cache -f -v
echo "JetBrains Mono Nerd Font instalada com sucesso!"


# 2. Instalação do Neovim (Binário Local)
echo "--- 2. Instalando Neovim (Binário Local /opt/nvim) ---"
NVIM_ARCHIVE="nvim-linux-x86_64.tar.gz"
LOCAL_ARCHIVE_PATH="./apps/${NVIM_ARCHIVE}"

# VERIFICAÇÃO CRÍTICA: Checa se o binário local existe
if [ ! -f "${LOCAL_ARCHIVE_PATH}" ]; then
    echo "ERRO FATAL: Arquivo ${NVIM_ARCHIVE} não encontrado em ${LOCAL_ARCHIVE_PATH}"
    echo "Abortando. Verifique o local em ~/dotfiles/apps/"
    exit 1
fi

# Descompacta o binário local e move para /opt
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf ${LOCAL_ARCHIVE_PATH}
sudo mv /opt/nvim-linux-x86_64 /opt/nvim
echo "Neovim instalado em /opt/nvim."


# 3. Instalação do Oh My Zsh
echo "--- 3. Instalando Oh My Zsh ---"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh já instalado."
fi

# Instala plugins do Zsh necessários (zsh-autosuggestions e zsh-syntax-highlighting)
echo "--- Instalando Plugins do Zsh ---"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
fi

# 4. Configuração do Shell e Diretórios de Ferramentas
echo "--- 4. Configurando Zsh e Diretórios ---"
# Define o Zsh como shell padrão (será aplicado no próximo login)
chsh -s $(which zsh)

# Cria diretórios necessários para Tmuxifier e TPM
mkdir -p ~/.config/tmuxifier/layouts
mkdir -p ~/.tmux/plugins


# 5. Instalação do TPM (Tmux Plugin Manager)
echo "--- 5. Instalando o TPM ---"
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "TPM já instalado."
fi

echo "--- INSTALAÇÃO BÁSICA DE SOFTWARE CONCLUÍDA! ---"
