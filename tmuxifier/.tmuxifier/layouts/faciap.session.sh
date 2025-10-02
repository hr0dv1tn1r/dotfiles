session_root "~/Desktop/SILO - FACIAP/"

if initialize_session "faciap"; then

  window_root "~/Desktop/FACIAP/faciap-api/"
  new_window "API"
  run_cmd "cd ~/Desktop/FACIAP/faciap-api/"
  run_cmd "nvim ."
  split_h 50

  window_root "~/Desktop/FACIAP/faciap-manager/"
  new_window "MANAGER"
  run_cmd "cd ~/Desktop/FACIAP/faciap-manager/"
  run_cmd "nvim ."
  split_h 50

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
