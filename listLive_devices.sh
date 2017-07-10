#!/bin/bash
fping -c1 -t500 $(for i in `seq # #`; do echo #.#.#.$i;done )  2> /dev/null |  awk ' { print $1 } '

nmap -sP #.#.#.* | awk ' NR % 2 == 1 { print $5} '

# will show only the alive devices on given seq
# used in to find alive devices form dhcp pool # to #
