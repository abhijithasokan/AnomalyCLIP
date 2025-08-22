#!/bin/bash
#SBATCH -t 08:00:00        
#SBATCH -J tt                          # the job names

#SBATCH --ntasks-per-node=1               # request 4 tasks per node
#SBATCH --cpus-per-task=2                # use 1 thread per taks
#SBATCH -N 1                             # request slots on 1 node

#SBATCH --gpus=1                           # request 1 Volta V100 GPU
#SBATCH --gpu_cmode=shared               # Set the GPU into shared mode, so that multiple processes can run on it
#SBATCH --partition=gpuidle #informatik-mind                  # run on one of our DGX servers
#SBATCH --mem-per-gpu=16G

#SBATCH --output=job_logs/ano_clip/%j_out.txt       # capture output
#SBATCH --error=job_logs/ano_clip/%j_error.txt      # and error streams


module load anaconda3/latest
. $ANACONDA_HOME/etc/profile.d/conda.sh

conda activate all_class_ad3


bash test_mvtec3d.sh


conda deactivate





