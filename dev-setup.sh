#!/apollo/env/envImprovement/bin/zsh

function start_session () {
  tmux has-session -t=$1 2>/dev/null

  if [ $? != 0 ]
  then
    tmux new-session -d -s $1

    # Call function passed in and pass the name of the session along
    $2 $1
  else
    echo "Session ${1} already exists"
  fi
}

function config_save () {
  tmux send-keys "nvim ~/save.md" C-m
}

function config_vim () {
  tmux send-keys "cd ~/.vim && nvim vimrc" C-m
}

function setup_split () {
  cd_to_destination="cd -P ${1}"
  session_name=$1
  callback=$2
  server_command=$3

  tmux splitw -h -p 16
  tmux splitw -v

  tmux selectp -t 0
  tmux send-keys "${cd_to_destination} && nvim" C-m

  tmux selectp -t 1

  # Call callback function if defined and pass name and server command along
  if [ ! -z "$2" ]
  then
    $callback $session_name $server_command
  else
    # If no callback is specified, just change directory to the destination
    tmux send-keys "${cd_to_destination}" C-m
  fi

  tmux selectp -t 2
  tmux send-keys "${cd_to_destination}" C-m

  tmux selectp -t 0
}

function start_server () {
  cd_to_sim="cd -P ${1}"

  while true; do
    read "yn?Do you want to start server for ${1}? (y/n): "

    case $yn in
      [yY][eE][sS]|[yY]) tmux send-keys "${cd_to_sim} && brazil-build ${2}" C-m; break;;
      [nN][oO]|[nN]) tmux send-keys "${cd_to_sim}" C-m; break;;
      * ) echo "Please answer yes or no";;
    esac
  done
}

function config_sim () {
  setup_split "~/$1" start_server "start"
}

function config_gql () {
  # Don't ask to start server if gql
  if [ "$1" = "gql" ]
  then
    setup_split "~/$1"
  else
    setup_split "~/$1" start_server "server"
  fi
}

function config_simtest () {
  while true; do
    read "location?Where would you like simtest to point to? (1: Assets1, 2: Assets2, 3: Assets3): "

    case $location in
      [1]) setup_split "~/simt/../SIMTicketingTesting"; break;;
      [2]) setup_split "~/simt2/../SIMTicketingTesting"; break;;
      [3]) setup_split "~/simt3/../SIMTicketingTesting"; break;;
      * ) echo "Please choose 1, 2, or 3.";;
    esac
  done
}

function start_extra () {
  read "yn?Do you want to set up an extra split? [y/N]: "

  case $yn in
    y|Y) read "location?Where do you want to setup the extra split? [~/]: ";;
    *) return;;
  esac

  tmux has-session -t=extra 2>/dev/null

  if [ $? != 0 ]
  then
    tmux new-session -d -s extra
  else
    tmux kill-session -t extra
    tmux new-session -d -s extra
  fi

  setup_split "$location"
}

start_session "save" config_save

start_session "vimconfig" config_vim

start_session "simt" config_sim

start_session "simt2" config_sim

start_session "simt3" config_sim

start_session "gql" config_gql

start_session "gqls" config_gql

start_session "simtest" config_simtest

start_extra
