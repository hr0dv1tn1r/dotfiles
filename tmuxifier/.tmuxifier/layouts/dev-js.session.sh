# ~/.config/tmuxifier/layouts/dev.session.sh

# Define a raiz da sessão.
session_root "~/Desktop/DEV"

if initialize_session "dev"; then
  # Primeira Janela: SERVER
  # ---------------------------------------------
  window_root "~/Desktop/DEV/server"  # Define o diretório inicial APENAS para esta janela.
  new_window "_SERVER"
  run_cmd "nvim ."
  
  split_h 50
  run_cmd "docker-compose down"
  run_cmd "docker-compose up -d"

  split_v 50
  run_cmd "npm i" 
  run_cmd "npm run db:generate && sleep 2" 
  run_cmd "npm run db:migrate && sleep 2" 
  run_cmd "npm run db:seed && sleep 2" 
  
  split_v 50
  run_cmd "npm run dev" 

  # Segunda Janela: WEB
  # ---------------------------------------------
  window_root "~/Desktop/DEV/web" # Define o diretório inicial para a janela "WEB".
  new_window "_WEB"
  run_cmd "nvim ."

  split_h 50
  run_cmd "npm run dev" 
  
  split_v 50

  select_window 1
fi

# Finaliza a sessão e entra nela.
finalize_and_go_to_session
