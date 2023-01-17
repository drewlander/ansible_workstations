sudo pacman -Sy openssh sshpass
sudo systemctl start sshd
pip install ansible
ansible-playbook -i inventory tasks.yml --ask-become-pass -b -k
sudo systemctl stop sshd

