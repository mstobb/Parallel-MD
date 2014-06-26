#!/bin/sh
#PBS -l nodes=1:ppn=4
#PBS -l walltime=20:00:00
#PBS -q martinia
#PBS -N mdv4
#
cd $PBS_O_WORKDIR
unalias -a
#
#setenv LD_LIBRARY_PATH  ${HOME}/local/lib
#
module load lammps/1Feb14
#module load mpich
#echo $LD_LIBRARY_PATH > libs.dat
#ls /opt/intel/cce/10.1.015/lib/ > what.dat
#
#/bin/env >env.out
#
mpirun -n 4 lmp <in.blockAtom  > blockAtom1.out
mpirun -n 4 lmp <in.blockAtom2  > blockAtom2.out
mpirun -n 4 lmp <in.blockAtom3  > blockAtom3.out
mpirun -n 4 lmp <in.blockAtom4  > blockAtom4.out
mpirun -n 4 lmp <in.blockAtom5  > blockAtom5.out
mpirun -n 4 lmp <in.blockAtom6  > blockAtom6.out






