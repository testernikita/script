# dnssetup.sh
# by juicy team in 2021
# Скрипт скачивает и устанавливает скрипт dns.sh без участия пользователя

clear
spinner=( Ooooo oOooo ooOoo oooOo ooooO oooOo ooOoo oOooo);

count(){
  end=$((SECONDS+4))
  while [ $SECONDS -lt $end ];
  do 
    for i in ${spinner[@]}; 
    do 
      echo -ne "\r$i";
      sleep 0.2;
    done;
  done
  echo ""
}
 
echo "Установка: cкрипта позволяющего менять DNS сервера не заходя в Wi-Fi интерфейс MacOS"
echo "-----------------------------------"
# очистка предыдещей версии
echo "Шаг 1 из 6"
echo "Удаляем предыдущую версию скрипта"
count
rm -rf ~/scripts/innotech
echo "-----------------------------------"

# создание папки
echo "Шаг 2 из 6"
echo "Создаем папку ~/scripts/innotech"
count
mkdir -p ~/scripts/innotech
echo "-----------------------------------"

# скачивание скрипта в папку
echo "Шаг 3 из 6"
echo "Скачиваем скрипт в ~/scripts/innotech/dns.sh"
curl -o ~/scripts/innotech/dns.sh https://github.com/testernikita/script/blob/main/dns.sh
echo "-----------------------------------"


# полномочия для запуска
echo "Шаг 4 из 6"
echo "Даем скрипту ~/scripts/innotech/dns.sh полномочия на запуск"
count
chmod +x ~/scripts/innotech/dns.sh
echo "-----------------------------------"

# добавление комманды в терминал
echo "Шаг 5 из 6"
echo "Добавляем alias 'dns' в ~/.bashrc"
count
echo "# innotech dns script binding" >> ~/.bashrc
echo "alias dns='~/scripts/innotech/dns.sh'" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "-----------------------------------"

echo "Шаг 6 из 6"
echo "Добавляем alias 'dns' в ~/.zshrc"
count
echo "# innotech dns script binding" >> ~/.zshrc
echo "alias dns='~/scripts/innotech/dns.sh'" >> ~/.zshrc
echo "" >> ~/.zshrc
echo "-----------------------------------"
echo "Закройте и откройте терминал для завершения установки."