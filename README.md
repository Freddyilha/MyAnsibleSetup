# MyAnsibleSetup

Command to exec the script

ansible-playbook setup.yml -i hosts.yml -i vars.yml --extra-vars "ansible_sudo_pass=ROOT_PASSWORD"


# Copy all templates to templates folder
cp {.alacritty.yml,.bashrc,.tmux.conf,.vimrc,.xbindkeysrc,.xinitrc,.zimrc,.zshrc} MyAnsibleSetup/templates
