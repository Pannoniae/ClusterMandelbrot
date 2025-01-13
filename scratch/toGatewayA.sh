#!/bin/bash
for file in "$@"
do
    scp -r "./$file" 40536446@gateway.napier.ac.uk:./
done
