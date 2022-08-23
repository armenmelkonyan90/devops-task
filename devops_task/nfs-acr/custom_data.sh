#!/bin/bash
sudo apt-get install -y nfs-kernel-server
sudo mkdir -p /var/nfs/kubedata
sudo chown nobody:nogroup /var/nfs/kubedata
sudo echo "/var/nfs/kubedata		*(rw,sync,no_subtree_check,no_root_squash,no_all_squash,insecure)" >> /etc/exports
sudo systemctl enable --now nfs-server
sudo systemctl start nfs-server
sudo exportfs -rav
