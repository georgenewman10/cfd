#!/bin/bash

#SBATCH -J name        # Job name
#SBATCH -o job.%j.out    # Specify stdout output file (%j expands to jobId)
#SBATCH -e job.%j.err    # Specify stdout error file (%j expands to jobId)

#SBATCH -p normal        # Queue name
#SBATCH -N 1             # Total number of nodes requested
#SBATCH -n 1             # Total number of tasks
#SBATCH -t 00:10:00      # Run time (hh:mm:ss)

#SBATCH -A ASE-347-SP2017  # project that is charged

#SBATCH --mail-user=email@domain.com
#SBATCH --mail-type=begin  # email me when the job starts
#SBATCH --mail-type=end    # email me when the job finishes

# load the environment required for OpenFOAM 2.3.0
module load intel/14.0.1.106
module load openfoam/2.3.0

# run 
ibrun blockMesh
ibrun icoFoam 


