#!/usr/bin/env bash

function calc_pi() {
    { echo -n "scale=$1;"; seq 1 2 200 | xargs -n1 -I{} echo '(16*(1/5)^{}/{}-4*(1/239)^{}/{})';} | paste -sd-+ | bc -l
}
time calc_pi $1
echo "$(ps ax | grep $$ | grep -v grep) <--- complete!"
