#!/usr/bin/env bash

time grep -r -E -i '^[0-9a-z]+$' / >nice.log 2>nice.err
echo "Nice scan complete!"
