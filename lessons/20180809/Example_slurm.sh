#!/bin/bash

#SBATCH --job-name=aminoR
#SBATCH -o aminoR.out
#SBATCH -e aminoR.err
#SBATCH --mail-user=anastasa@alumni.ubc.ca
#SBATCH --mail-type=BEGIN,END,FAIL
#
#SBATCH --time=02:55:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32
#SBATCH --mem 114000
#SBATCH --account=groupname

## So here I've requested:
## Job Name: aminoR
## Process output redirect: aminoR.out (can be any file, doesn't have to be job name)
## Process error redirect: aminoR.err  (can also specify a path, otherwise it puts these in current directory)
## Email this email --
## When my program begins, ends and/or fails
## Maximum time: 2h 55mins (Staying within a scheduling bracket gives scheduling advantage
## (3hours, 12hours, 24hours, 72hours, 7days, etc.))
## Number of nodes: 1 (one shared memory computer essentially)
## ntasks-per-node: 1 (for manual parallelization -- advanced)
## Number of CPUs per task: 32
## There is a scheduling bonus for using the entire node (all 32 CPUs) on Cedar/Graham
## Maximum memory usage: 114000MB (Essentially the whole node's memory (128GB for a "small node")
## Leave some grace room because the OS/scheduler takes some space.)
## Account argument is only necessary if you have more than one allocation.

#You'll probably have to load a module or two:
module load r/3.4.3

#Now you can just run the program
Rscript --vanilla Amino_Acid_Select.R

### Memory usage: should be estimated, and probably estimated high
### Time: This should be your best guess at the time it should take, plus some padding.
### If you can get it in a nice time zone for scheduling, great, but make sure it has time to finish.
