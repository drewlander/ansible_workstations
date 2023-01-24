if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
fi
echo $OS
if [[ $OS =~ "Fedora" ]]; then
  echo "fedora detected"
  mkdir -p ~/source/virtual_envs
  python3 -m venv ~/source/virtual_envs/ansible
elif [[ $OS =~ "Debian" ]]; then
  echo "debian detected"
  sudo apt install python3-venv sshpass openssh-server -y
  mkdir -p ~/source/virtual_envs
  python3 -m venv ~/source/virtual_envs/ansible
fi
sudo systemctl start sshd
source ~/source/virtual_envs/ansible/bin/activate
pip install ansible
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory tasks.yml --ask-become-pass -b -k
sudo systemctl stop sshd
deactivate

