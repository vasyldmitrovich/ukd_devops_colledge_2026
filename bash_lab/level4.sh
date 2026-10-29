#!/bin/bash

tools=("neovim" "docker" "git")
echo "Мій масив: ${tools[@]}"

sys_info() {
  echo "Запуск перевірки системи..."
}
sys_info

for i in {1..5}; do
  if [ $i -eq 3 ]; then
    echo "Знайдено число 3"
  fi
done

echo "Процеси системи:"
ps aux | grep systemd | head -n 3

echo -e "docker\npodman\ncontainer" | grep "er$"
