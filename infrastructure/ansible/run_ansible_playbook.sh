#!/bin/bash

IP_ADDRESS=$1
count=0
max_retries=3
delay=20

while [ $count -lt $max_retries ]
do
  echo "Waiting for $delay seconds before running playbook..."
  sleep $delay
  ansible-playbook -i "${IP_ADDRESS}," -u adminuser --private-key=~/.ssh/ssh-provision-python-vm-in-minutes.pem -e 'ansible_ssh_common_args="-o StrictHostKeyChecking=no"' playbook.yml && break
  
  count=$[$count+1]
  echo "Playbook failed. Attempt: $count/$max_retries..."
done

if [ $count -eq $max_retries ]; then
  echo "Max retries reached, exiting..."
  exit 1
fi
