# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/projects/video-twitch"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "twitch-clone"; then

  # Create a new window inline within session layout definition.
  new_window "Editor"
  new_window "Terminal"

  select_window "Terminal"
  split_h
  select_pane 1
  run_cmd "npm run dev"
  select_pane 2
  run_cmd "docker compose up -d"

  select_window "Editor"
  run_cmd "nvim"

  # Load a defined window layout.
  #load_window "example"

  # Select the default active window on session creation.
  #select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
