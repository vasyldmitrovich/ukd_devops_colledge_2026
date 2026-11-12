#!/bin/bash

ps aux | grep ssh
dev_tools=("Docker" "Kubernetes" "Terraform" "Ansible")
echo "${dev_tools[@]}"

say_hi() {
  echo "hiy"
}
say_hi

echo "--- Модифікований цикл ---"
for tool in "${dev_tools[@]}"; do
  if [ "$tool" == "Docker" ]; then
    echo "$tool - це про контейнери."
  else
    echo "$tool - це щось інше."
  fi
done
