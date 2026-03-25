podman build -f <(cat << EOF
FROM ubuntu
run apt update && apt install nmap ssh proxychains vim nano -y 
run echo "PS1='\[\e[92m\]\u\[\e[0m\]@\[\e[94m\]\h\[\e[0m\]:\[\e[35m\]\w\[\e[0m\]\\$ '" >> ~/.bashrc
cmd ["/bin/bash"]
EOF
) -t ssh_tools; 
podman run -it -e TERM=xterm-256color ssh_tools
