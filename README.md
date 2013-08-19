Загрузка - убрать из параметров ядра quiet splash
rcconf - "автоматизированный" update-rc.d, чтобы выбирать запускаемые службы
Ставить openbox, obconf, obmenu. Отрубать менеджер логинов (lightdm), в ~/.bashrc добавить условие ![ -f "/tmp/.X0-lock" ] для автоматического запуска Xorg
После редактировать ~/.xinitrc на запуск сессии openbox (ck-session-launch dbus-launch ... нужно, чтобы работало монтирование через наутилус и выключение через DBus без прав суперпользователя)
Убрать все из ~/.config/autostart и /etc/xdg/autostart (там обычно находится мусор от GNOME)
pypanel, conky, gmrun, tilda, feh
lm-sensors, hddtemp
volumeicon - апплет регулятора громкости
Тема иконок Faenza-Dark, GTK2,3 - Mediterranean-Darkest 
Сглаживание шрифтов включать в ~/.Xresources
Конфиги тут.
