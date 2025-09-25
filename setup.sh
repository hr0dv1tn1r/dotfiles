#!/bin/bash

# 1. Atualiza os pacotes e instala ferramentas essenciais
echo "--- Atualizando o sistema e instalando dependências ---"
# Instala dependências e ferramentas essenciais
sudo apt update
sudo apt install -y git wget curl build-essential stow zsh tmux

# 2. Instala a versão mais recente do Neovim (Binário pré-compilado)
echo "--- Instalando Neovim (binário pré-compilado) ---"
# Define o nome do arquivo
NVIM_ARCHIVE="nvim-linux64.tar.gz"

# Remove instalações anteriores e binários antigos no /opt
echo "Limpando instalações antigas..."
sudo rm -rf /opt/nvim-linux64

# Baixa o binário mais recente do GitHub
echo "Baixando o pacote do Neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/${NVIM_ARCHIVE}

# Descompacta o arquivo para o diretório /opt
echo "Descompactando para /opt..."
sudo tar -C /opt -xzf ${NVIM_ARCHIVE}

# Renomeia a pasta de descompactação para um nome simples e universal
sudo mv /opt/nvim-linux64 /opt/nvim

# Limpa o arquivo de download
rm ${NVIM_ARCHIVE}

# 3. Define o Zsh como shell padrão
echo "--- Definindo o Zsh como shell padrão ---"
chsh -s $(which zsh)

# 4. Cria diretórios de trabalho (para tmuxifier e plugins do tmux)
echo "--- Configurando diretórios iniciais ---"
mkdir -p ~/.config/tmuxifier/layouts
mkdir -p ~/.tmux/plugins

# 5. Instala o Tmux Plugin Manager (TPM)
if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "--- Instalando o TPM ---"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "TPM já instalado."
fi

echo "--- Instalação de software concluída! ---"
