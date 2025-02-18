#!/bin/bash
#SBATCH --job-name=fastqc_multiqc                # Job name
#SBATCH --output=fastqc_multiqc_%A_%a.out        # Output file
#SBATCH --error=fastqc_multiqc_%A_%a.err         # Error file
#SBATCH --time=06:00:00                          # Time limit hrs:min:sec
#SBATCH --partition=normal                       # Partition name
#SBATCH --nodes=1                                # Number of nodes
#SBATCH --ntasks=1                               # Number of tasks
#SBATCH --cpus-per-task=4                        # Number of CPUs
#SBATCH --mem=8G                                 # Memory per node
#SBATCH --array=1-24                             # Adjust based on the number of FASTQ files

# Load necessary modules
module load biology
module load fastqc/0.11.8
module load py-multiqc/1.6_py36

# Define directories
FASTQ_DIR="/oak/stanford/groups/jfrydman/natalia/fabian/LUCI/project_root/raw_data/fastq"
OUTPUT_DIR="/oak/stanford/groups/jfrydman/natalia/fabian/LUCI/project_root/preprocessing/fastqc_reports"
MULTIQC_OUTPUT_DIR="/oak/stanford/groups/jfrydman/natalia/fabian/LUCI/project_root/preprocessing/multiqc_report"

# Create output directories if they don't exist
mkdir -p "$OUTPUT_DIR"
mkdir -p "$MULTIQC_OUTPUT_DIR"


# Step 1: Run FastQC for each file in the array
FASTQ_FILE=$(ls $FASTQ_DIR/*.fastq.gz | sed -n "${SLURM_ARRAY_TASK_ID}p")
fastqc -o "$OUTPUT_DIR" -t 4 "$FASTQ_FILE"

# Wait until all array jobs complete for MultiQC
if [ "$SLURM_ARRAY_TASK_ID" -eq 1 ]; then
    # Wait for all FastQC jobs to finish
    scontrol wait_job $SLURM_JOB_ID

    # Step 2: Run MultiQC to combine all FastQC reports
    multiqc "$OUTPUT_DIR" -o "$MULTIQC_OUTPUT_DIR"
    echo "MultiQC report generated at $MULTIQC_OUTPUT_DIR."
fi
