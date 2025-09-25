#!/bin/bash

# ====================================================================
# SCRIPT DE INSTALAÇÃO INICIAL
# ====================================================================

# 1. Instalação de Ferramentas Essenciais
echo "--- 1. Instalando Dependências e Ferramentas Essenciais ---"
sudo apt update
sudo apt install -y git wget curl build-essential stow zsh tmux

# 2. Instalação do Neovim (Binário Local)
echo "--- 2. Instalando Neovim (Binário Local /opt/nvim) ---"
NVIM_ARCHIVE="nvim-linux-x86_64.tar.gz"
LOCAL_ARCHIVE_PATH="./apps/${NVIM_ARCHIVE}"

# Checa se o binário existe
if [ ! -f "${LOCAL_ARCHIVE_PATH}" ]; then
    echo "ERRO FATAL: Arquivo ${NVIM_ARCHIVE} não encontrado em ${LOCAL_ARCHIVE_PATH}"
    echo "Verifique o local e execute novamente."
    exit 1
fi

# Descompacta o binário local e move para /opt
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf ${LOCAL_ARCHIVE_PATH}
sudo mv /opt/nvim-linux-x86_64 /opt/nvim

echo "Neovim instalado em /opt/nvim."

# 3. Configuração Inicial do Shell
echo "--- 3. Definindo o Zsh e Diretórios ---"
chsh -s $(which zsh)

# 4. Instalação do Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "--- 4. Instalando Oh My Zsh ---"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh já instalado."
fi

# 5. Cria diretórios necessários para Tmuxifier e TPM
echo "--- 5. Configurando Diretórios de Ferramentas ---"
mkdir -p ~/.config/tmuxifier/layouts
mkdir -p ~/.tmux/plugins

# 6. Instalação do TPM (Tmux Plugin Manager)
if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "--- 6. Instalando o TPM ---"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "TPM já instalado."
fi

echo "--- INSTALAÇÃO BÁSICA CONCLUÍDA! ---"
