#!/bin/sh
echo "#units metal
atom_modify map array
dimension 3
boundary s s s
units metal
atom_style atomic
neighbor 2.0 bin
neigh_modify delay 0 every 1 check yes

read_data dimension.lmp


#create atoms
lattice fcc 4.0788 orient x 1 0 0  orient y 0 1 0 orient z 0 0 1
region rsub block  25 75 25 75 0 20 units box
region rbot block 25 75 25 75 0 3 units box
region abov1 block  49 51 49 51 19 23 units box
#region abov2 block  39 41 39 41 19 23 units box
#region abov union 2 abov1 abov2
create_atoms 1 region rsub
create_atoms 1 region abov1


# define  potentials
pair_style eam/alloy 
pair_coeff * * Pt-Au.eam.alloy Au

# define groups
group mobile region rsub
group single region abov1
group bottom region rbot

# initial velocities
#velocity mobile create 10 482748
#velocity single create 10000 482748
#velocity all create 400 482748

# fixes
#fix 1 mobile nvt temp 700 700 1
#fix 2 single nvt temp 10000 10000 1
fix 1 all nvt temp $1 $1 1
fix 3 bottom setforce 0.0 0.0 0.0

compute msd_abov single displace/atom

#variable dist atom sqrt(x[290]^2+y[290]^2+z[290]^2)
#variable time atom stride(0,50000,1)

timestep 0.001
thermo 200
thermo_style custom step temp ke pe
thermo_modify lost warn

dump 1 single custom 80 output/$2.dump.lammpstrj id xs ys zs c_msd_abov[4] #v_time
#dump_modify 1 scale no

run 100000"
