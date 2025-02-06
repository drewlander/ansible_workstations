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
  sudo dnf -y install sshpass python3-libdnf5
elif [[ $OS =~ "Debian" ]]; then
  echo "debian detected"
  sudo apt install python3-venv sshpass openssh-server sshpass -y
  mkdir -p ~/source/virtual_envs
  python3 -m venv ~/source/virtual_envs/ansible
elif [[ $OS =~ "EndeavourOS" ]]; then
  echo "EndeavorOS detected"
  sudo pacman -Sy sshpass
  mkdir -p ~/source/virtual_envs
  python3 -m venv ~/source/virtual_envs/ansible
elif [[ $OS =~ "Arch Linux" ]]; then
  echo "Arch Linux detected"
  sudo pacman -Sy sshpass
  mkdir -p ~/source/virtual_envs
  python3 -m venv ~/source/virtual_envs/ansible
elif [[ $OS =~ "FreeBSD" ]]; then
  echo "FreeBSD detected"
  mkdir -p ~/source/virtual_envs
  #python3.11 -m venv ~/source/virtual_envs/ansible
   doas pkg install -y py311-ansible sshpass
fi


if [[ $OS =~ "FreeBSD" ]]; then
	doas service sshd start
	ANSIBLE_PYTHON_INTERPRETER=/usr/local/bin/python3.11 ANSIBLE_BECOME_METHOD=doas ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory tasks.yml --ask-become-pass -b -k
else

    sudo systemctl start sshd
    source ~/source/virtual_envs/ansible/bin/activate
    pip install ansible
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory tasks.yml --ask-become-pass -b -k 
deactivate
fi



