#!/usr/bin/env bash

# занулим на всякий случай суперблоки
mdadm --zero-superblock --force /dev/sd{b,c,d,e}

# создаем RAID
mdadm --create --verbose /dev/md0 -l 10 -n 4 /dev/sd{b,c,d,e}

# для того, чтобы быть уверенным, что ОС запомнила какой RAID массив
# требуется создать и какие компоненты в него входят создадим файл mdadm.conf
mkdir /etc/mdadm
mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf

# создаем таблицу разделов GPT на RAID
parted -s /dev/md0 mklabel gpt

# создаем разделы
parted /dev/md0 mkpart primary ext4 0% 20%
parted /dev/md0 mkpart primary ext4 20% 40%
parted /dev/md0 mkpart primary ext4 40% 60%
parted /dev/md0 mkpart primary ext4 60% 80%
parted /dev/md0 mkpart primary ext4 80% 100%

# делаем ФС на каждой из этих партиций
for i in $(seq 1 5); do sudo mkfs.ext4 /dev/md0p$i; done

# монтируем разделы в директории и заполняем fstab
mkdir -p /raid/part{1,2,3,4,5}
for i in $(seq 1 5); do
    mount /dev/md0p$i /raid/part$i
    echo "/dev/md0p$i     /raid/part$i     ext4    defaults    0   0" >> /etc/fstab
done
