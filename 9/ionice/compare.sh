#!/usr/bin/env bash

ionice -c3 -n7 ./nice.sh &
ionice -c2 -n0 ./notnice.sh &
