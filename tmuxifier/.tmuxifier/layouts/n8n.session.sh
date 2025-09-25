# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Desktop/N8N"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "n8n"; then
  window_root "~/Desktop/N8N"
  new_window "N8N"
  run_cmd "ssh chief@192.168.122.27"
  run_cmd "cd n8n-compose/"

  split_h 50
  run_cmd "ssh chief@192.168.122.27"
  run_cmd "cd n8n-compose/"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
