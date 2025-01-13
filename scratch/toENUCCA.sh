#!/bin/bash
for file in "$@"
do
    scp -r "./$file" 40536446@login.enucc.napier.ac.uk:./
done
