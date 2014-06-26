#!/bin/sh
#PBS -l nodes=1:ppn=6
#PBS -l walltime=20:00:00
#PBS -q martinia
#PBS -N mdv4
mpi_run_lammps.sh 100 100
