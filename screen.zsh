#/bin/bash
SESSION=$USER
byobu new-session -d -s $SESSION

# JIVEworks window
byobu rename-window -t $SESSION:0 'JIVEworks'

byobu split-window -v
byobu split-window -h

# select 1st pane and run commands
byobu select-pane -t 0
byobu send-keys "vagrant box remove hive/brand" C-m
wait 1
byobu send-keys "y" C-m
byobu send-keys "cd Projects/orange-brand" C-m
byobu send-keys "rm .vagrant/machines/default/virtualbox/synced_folders" C-m
byobu send-keys "git checkout development" C-m
byobu send-keys "git pull --rebase" C-m
byobu send-keys "vagrant up" C-m
byobu send-keys "vagrant ssh" C-m

# start drush function to update elastic search
byobu send-keys "cd /vagrat/webroot: C-m
byobu send-keys "time drush --debug ev '$nids = db_query("select nid from node where status=1")->fetchAllKeyed(); foreach($nid as $nid => $f){$node = node_load($nid); orange_brand_rules_update_elastic_search($node);}" C-m
# end of drush function
byobu send-keys "cd /vagrant/tests/functional" C-m
byobu send-keys "./bin/behat -p selenium" C-m

# 2nd pane
byobu select-pane -t 1
byobu send-keys "cd Projects/orange-brand-search-be" C-m
byobu send-keys "git branch" C-m
byobu send-keys "git status" C-m
byobu send-keys "git pull --rebase" C-m
byobu send-keys "vagrant destroy --force" C-m
byobu send-keys "y" C-m
byobu send-keys "vagrant up --provision" C-m
byobu send-keys "vagrant ssh" C-m
byobu send-keys "cd /vagrant/" C-m

# 3rd pane
byobu select-pane -t 2
byobu send-keys "start-selenium" C-m

# create 4th pane
byobu select-pane -t 0
byobu split-window -h
byobu select-pane -t 3
byobu send-keys "yourock" C-m


