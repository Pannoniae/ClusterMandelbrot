#!/bin/bash

# Create a temporary file with node, worker, and size values for sorting
while IFS= read -r file; do
    filename=$(basename "$file")
    params=${filename#mandelbrot}
    params=${params%.clic}

    # Extract n, w, and size values
    nodes=$(echo "$params" | grep -o '[0-9]*n' | grep -o '[0-9]*')
    workers=$(echo "$params" | grep -o '[0-9]*w' | grep -o '[0-9]*')
    size=$(echo "$params" | grep -o '[0-9]*$')

    # Output format: nodes workers size original_params
    echo "$nodes $workers $size $params"
done < <(ls mandelbrot/*.clic) | \
    # Sort by nodes, then workers, then size
    sort -n -k1,1 -k2,2 -k3,3 | \
    # Generate the final output, taking only the original params
    awk '{print "./submit.sh " $4}' > submitall.sh
