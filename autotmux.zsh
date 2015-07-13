#/bin/bash
SESSION=$USER
byobu new-session -d -s $SESSION

# JIVEworks window
byobu rename-window -t $SESSION:0 'JIVEworks'

byobu split-window -v
byobu split-window -h

# select first pane and run commands
byobu select-pane -t 0
byobu send-keys "cd Projects/orange-brand" C-m
byobu send-keys "git branch" C-m
byobu send-keys "git status" C-m
byobu send-keys "git pull --rebase" C-m
byobu send-keys "vagrant destroy" C-m
wait 1
byobu send-keys "y" C-m
byobu send-keys "vagrant up --provision" C-m
byobu send-keys "vagrant ssh" C-m
byobu send-keys "cd /vagrant/" C-m

# second pane
byobu select-pane -t 1
byobu send-keys "cd Projects/orange-brand-search-be" C-m
byobu send-keys "git branch" C-m
byobu send-keys "git status" C-m
byobu send-keys "git pull --rebase" C-m
byobu send-keys "vagrant destroy" C-m
wait 1
byobu send-keys "y" C-m
byobu send-keys "vagrant up --provision" C-m
byobu send-keys "vagrant ssh" C-m
byobu send-keys "cd /vagrant/" C-m

# third pane
byobu select-pane -t 2
byobu send-keys "selenium_up" C-m

# switch back to first pane
byobu select-pane -t 0
