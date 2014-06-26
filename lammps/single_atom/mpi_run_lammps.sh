#!/bin/sh 
#echo module load lammps/1Feb14
lammps_input.sh $1 $1 > tmp
mpirun -n 6 lmp < tmp  > output/$1_K_out
#mpirun -n 2 lammps-daily < tmp  > output/$1_K_out
