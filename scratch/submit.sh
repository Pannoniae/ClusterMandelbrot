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

# total nodes = n + 3
# start node = 2
# end node = 2 + total nodes
# num_nodes = n + 2 because host is not included
num_nodes=$((specified_nodes + 2))
total_nodes=$((specified_nodes + 3))
end_node=$((num_nodes + 2))
cpus_per_task=$((workers_per_node + 2))



sbatch --job-name="$1" -D /users/40536446/scripts --output="$1".out --mail-user="40536446@napier.ac.uk" --mail-type=ALL --time=45 --ntasks=$total_nodes --nodes=$total_nodes --nodelist node[02-"$(printf "%02d" $end_node)"] --cpus-per-task=$cpus_per_task ./multirun.sh "$1"