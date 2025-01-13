#!/bin/bash
ip=$(hostname -i)
printf "Node ip is %s: running a node process\n" $ip

java -jar ../mandelbrot/NetNode2.jar 10.10.0.102
