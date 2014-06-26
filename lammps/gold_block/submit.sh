#PBS -l nodes=1:ppn=6
#PBS -l walltime=20:00:00
#PBS -q martinia
#PBS -N mdv4
#
#cd $PBS_O_WORKDIR
#unalias -a
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
mpirun -n 6 lmp <in.gold  >gold.out
