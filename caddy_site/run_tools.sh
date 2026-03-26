mkdir ssh_config 2> /dev/null
podman build -f <(cat << EOF
FROM ubuntu
run apt update && apt install nmap ssh proxychains vim nano curl -y 
run echo "PS1='\[\e[92m\]\u\[\e[0m\]@\[\e[94m\]\h\[\e[0m\]:\[\e[35m\]\w\[\e[0m\]\\$ '" >> ~/.bashrc
cmd ["/bin/bash"]
EOF
) -t ssh_tools; 
# podman network create ssh_tools_net --subnet 10.88.0.0/24 --gateway 10.88.0.1;
podman run -it -v $(pwd)/ssh_config:/root/.ssh --network=host -e TERM=xterm-256color -w /root ssh_tools;
