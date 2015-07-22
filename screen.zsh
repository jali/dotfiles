#/bin/bash
SESSION=$USER
byobu new-session -d -s $SESSION

# JIVEworks window
byobu rename-window -t $SESSION:0 'JIVEworks'

byobu split-window -v
byobu split-window -h

# 3rd pane
byobu select-pane -t 2
byobu send-keys "sselenium" C-m


# select 1st pane and run commands
byobu select-pane -t 0

# create 4th pane
byobu split-window -h

byobu select-pane -t 0
byobu send-keys "cd ~/Projects/orange-brand" C-m
byobu send-keys "git checkout development" C-m
byobu send-keys "git pull --rebase" C-m
byobu send-keys "vagrant destory --force || true" C-m
byobu send-keys "rm .vagrant/machines/default/virtualbox/synced_folders || true" C-m
byobu send-keys "vagrant up --provision" C-m
byobu send-keys "vagrant ssh" C-m


# 2nd pane
byobu select-pane -t 1
byobu send-keys "cd ~/Projects/orange-brand-search-be" C-m
byobu send-keys "git branch" C-m
byobu send-keys "git status" C-m
byobu send-keys "git pull --rebase" C-m
byobu send-keys "vagrant destroy --force || true" C-m
byobu send-keys "vagrant up --provision" C-m
byobu send-keys "vagrant ssh" C-m
byobu send-keys "cd /vagrant/" C-m


byobu select-pane -t 0
# start drush function to update elastic search (removed)
byobu send-keys "cd /vagrant/webroot" C-m
sleep 180
# clear drupal cache
byobe send-keys "drush cc all"
# fire up selenium behat tests
byobu send-keys "cd /vagrant/tests/functional" C-m
byobu send-keys "pwd" C-m
byobu send-keys "\./bin/behat -p selenium" C-m




