#!/usr/bin/env bash

set -ex

if [ ! -f /etc/ssh/ssh_host_rsa_key ] && [ ! -f /etc/ssh/ssh_host_dsa_key ] && [ ! -f /etc/ssh/ssh_host_ecdsa_key ] && [ ! -f /etc/ssh/ssh_host_ed25519_key ]; then
    ssh-keygen -A
    mv /etc/ssh/ssh_host_rsa_key /root/sshd
    mv /etc/ssh/ssh_host_rsa_key.pub /root/sshd
    mv /etc/ssh/ssh_host_dsa_key /root/sshd
    mv /etc/ssh/ssh_host_dsa_key.pub /root/sshd
    mv /etc/ssh/ssh_host_ecdsa_key /root/sshd
    mv /etc/ssh/ssh_host_ecdsa_key.pub /root/sshd
    mv /etc/ssh/ssh_host_ed25519_key /root/sshd
    mv /etc/ssh/ssh_host_ed25519_key.pub /root/sshd
fi

ln -s -f /root/sshd/ssh_host_rsa_key /etc/ssh
ln -s -f /root/sshd/ssh_host_rsa_key.pub /etc/ssh
ln -s -f /root/sshd/ssh_host_dsa_key /etc/ssh
ln -s -f /root/sshd/ssh_host_dsa_key.pub /etc/ssh
ln -s -f /root/sshd/ssh_host_ecdsa_key /etc/ssh
ln -s -f /root/sshd/ssh_host_ecdsa_key.pub /etc/ssh
ln -s -f /root/sshd/ssh_host_ed25519_key /etc/ssh
ln -s -f /root/sshd/ssh_host_ed25519_key.pub /etc/ssh

passwd postgres -u && /usr/sbin/sshd -e && /usr/local/bin/docker-entrypoint.sh postgres
