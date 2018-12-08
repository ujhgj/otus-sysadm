#!/usr/bin/env bash

calc_pi.sh 100 &
sudo nice -n -20 ./calc_pi.sh 100 &
