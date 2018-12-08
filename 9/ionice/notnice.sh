#!/usr/bin/env bash

time grep -r -E -i '^[0-9a-z]+$' / >notnice.log 2>notnice.err
echo "Not nice scan complete ..."
