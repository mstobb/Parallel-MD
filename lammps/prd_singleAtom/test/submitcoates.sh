#PBS -l nodes=1:ppn=2
#PBS -l walltime=20:00:00
#PBS -q martinia
#PBS -N test

cd $PBS_O_WORKDIR
unalias -a

#setenv LD_LIBRARY_PATH  ${HOME}/local/lib

module load lammps/29Jul13
#module load fftw/2.1.5
#module load mpich2-1.4.1p1-gcc64/4.4.0


#echo $LD_LIBRARY_PATH > libs.dat
#ls /opt/intel/cce/10.1.015/lib/ > what.dat

#/bin/env >env.out
mpirun -np 2 lmp -partition 2x1 -in in.prd > prd.out




