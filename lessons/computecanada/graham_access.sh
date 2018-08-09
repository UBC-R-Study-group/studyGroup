# Call to connect to Graham

$ ssh yourUsername@graham.computecanada.ca

# Insert password
# Change directory to working folder (projects or scratch)

cd projects/group/username/WorkingFolder

# Copy slurm script to Graham
# FROM YOUR TERMINAL, NOT GRAHAM

scp path/to/script_or_file username@graham.computecanada.ca:path/to/destination

# Make new script in whatever language you want

vi newfilename.txt

# CC servers support C/C++, Fortran 90, Python, R, Java, Matlab, Chapel and more

# Submit batch job (slurm)

sbatch scriptname.#!/bin/sh

# Cancel batch job

scancel JobID#

# Check queued slurm jobs

squeue #-u username

# Use -u username argument to check only queue for one user
# or to delete all jobs queued for one user.

# Search for a module to load (to find available versions, for example)
# Can always check all available modules in CC documentation

module avail name_of_module

# Load or unload module
module load module_name
module unload module_name

# Request one or more node(s) for interactive use, for 1 hour, then use to run script

salloc --time=1:0:0 --ntasks=1
Rscript --vanilla Amino_Acid_Select.R

# Large jobs, especially those requiring inter-node communication, will be considerably faster in scratch space
# Scratch space is only backed up for 6 months, but nothing there will be deleted without you being informed
# and your memory allocation for it will be much larger, so it's a good place to keep in-progress files

# Install R package locally
# First scp tar.gz file to a good place in Cedar/Graham
# From within that folder call:

module load r/3.4.3

R

install.packages("package_name", repos = NULL, lib = "/home/path/to/library" )
