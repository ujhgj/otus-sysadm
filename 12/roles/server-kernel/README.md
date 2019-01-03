server-kernel
=========

Роль устанавливает параметры ядра в соотвествии с рекомендуемыми для веб-сервера значениями.

Используется служба sysctl и конфигурационный файл /etc/sysctl.conf.

Роль написана по материалам:
- [Настройка Linux для высоконагруженных проектов и защиты от DDoS](https://romantelychko.com/blog/1300/)
- [Сказ о sysctl’ях (народная пингвинская история)](https://habr.com/company/otus/blog/340870/)

Дополнительную информацию по настройке переменных, можно найти в TCP Tuning Guide.

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
         - { role: server-kernel, net.core.somaxconn: 1024 }

License
-------

BSD
