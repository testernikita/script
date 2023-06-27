# dns.sh
# by juicy team in 2021
# Скрипт позволяет менять DNS сервера не заходя в Wi-Fi интерфейс MacOS

if [ "$#" -ne 1 ]; then
    echo "# Передайте только один параметр!"
    echo "# Добавить DNS для VPN"
    echo "./dns.sh on"
    echo "# Очистить DNS для VPN"
    echo "./dns.sh off"
    exit 1
fi

if [ "$1" = "on" ]; 
then
    echo "Добавляю DNS [10.104.1.3; 10.1.1.2] на Wi-Fi интерфейс."
    echo "Если нужно, то введите пароль для завершения добавления..."
    sudo networksetup -setdnsservers Wi-Fi 10.104.1.3 10.1.1.2
    echo "DNS [10.104.1.3; 10.1.1.2] добавлены на Wi-Fi интерфейс"
    exit 0
elif [ "$1" = "off" ]; 
then
    echo "Очищаю DNS на Wi-Fi интерфейсе."
    echo "Если нужно, то введите пароль для завершения очищения..."
    sudo networksetup -setdnsservers Wi-Fi "Empty"
    echo "DNS очищены Wi-Fi интерфейсе"
    exit 0
else
    echo "# Вы передали неправильный параметр!"
    echo "# Добавить DNS для VPN"
    echo "./dns.sh on"
    echo "# Очистить DNS для VPN"
    echo "./dns.sh off"
    exit 1
fi