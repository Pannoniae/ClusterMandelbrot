#!/bin/bash

# Parse input
if [ $# -ne 1 ]; then
    echo "Usage: $0 <config>"
    echo "Example: $0 2n12w2048"
    exit 1
fi

# Extract parameters using regex
if [[ $1 =~ ^([0-9]+)n([0-9]+)w([0-9]+)$ ]]; then
    specified_nodes=${BASH_REMATCH[1]}
    workers_per_node=${BASH_REMATCH[2]}
    size=${BASH_REMATCH[3]}
else
    echo "Invalid parameter format. Expected format: NnWwSIZE"
    echo "Example: 2n12w2048"
    exit 1
fi

# Calculate actual number of nodes (specified + 2)
num_nodes=$((specified_nodes + 2))
end_node=$((num_nodes + 2))
cpus_per_task=$((workers_per_node + 2))

for n in $(seq 1 5)
do
    printf "Run Number : %s\n" "$n"
    printf "%d\n" $num_nodes
    printf "%d\n" $end_node
    printf "%d\n" $cpus_per_task
    srun -N 1 -n 1 --cpus-per-task=$cpus_per_task --exact --nodelist node[02] ./runHost.sh "$1" &
    srun -N "$specified_nodes" -n "$specified_nodes" --cpus-per-task=$cpus_per_task --exact --nodelist node[03-"$(printf "%02d" $end_node)"] ./runNode.sh &

    wait
done
