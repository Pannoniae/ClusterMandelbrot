#!/bin/bash
ip=$(hostname -i)
printf  "Host ip is %s: starting host node\n" $ip

java -jar ../mandelbrot/NetHost2.jar ../HPCmulti/$1
