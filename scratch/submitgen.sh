#!/bin/bash

while IFS= read -r file; do
    filename=$(basename "$file")
    params=${filename#mandelbrot}
    params=${params%.clic}

    # extract n, w, and size
    nodes=$(echo "$params" | grep -o '[0-9]*n' | grep -o '[0-9]*')
    workers=$(echo "$params" | grep -o '[0-9]*w' | grep -o '[0-9]*')
    size=$(echo "$params" | grep -o '[0-9]*$')

    echo "$nodes $workers $size $params"
done < <(ls mandelbrot/*.clic) | \
    # sort nodes, then workers, then size
    sort -n -k1,1 -k2,2 -k3,3 | \
    # discard everything EXCEPT the original input
    awk '{print "./submit.sh " $4}' > submitall.sh
