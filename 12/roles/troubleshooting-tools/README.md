troubleshooting-tools
=========

Устанавливает утилиты 
- vmstat
- iostat
- iotop
- htop
- atop
- strace
- ltrace
- gdb

и производит настройку atop

Requirements
------------

- Centos/7

Role Variables
--------------

Переменные и их значения по-умолчанию: [defaults/main.yml](./defaults/main.yml)

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: troubleshooting-tools }

License
-------

BSD
