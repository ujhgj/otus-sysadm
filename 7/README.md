# Домашнее задание #7. Пользователи и группы. Авторизация и аутентификация 

Домашнее задание
PAM
1. Запретить всем пользователям, кроме группы admin логин в выходные и праздничные дни

Результат:
- скрипт проверки условий доступа [/etc/pam_script_auth](holiday_denial/etc/pam_script_auth)
- вспомогательный скрипт для определения выходного дня [/usr/bin/today_is_holiday](holiday_denial/usr/bin/today_is_holiday)
(требуется python пакет workalendar)
- конфигурация [/etc/pam.d/login](holiday_denial/etc/pam.d/login)

2. Дать конкретному пользователю права рута

Результат:
- конфигурация [/etc/pam.d/login](cap_sys_admin/etc/pam.d/login) и 
[/security/capability.conf](cap_sys_admin/security/capability.conf) для выдачи пользователю cap_sys_admin 
при получении доступа к терминалу через интерактивный логин 
