#!/bin/bash

#SBATCH -A iPlant-Collabs
#SBATCH -N 1
#SBATCH -n 12
#SBATCH -t 02:00:00
#SBATCH -p development
#SBATCH -J deseq2
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user scottdaniel@email.arizona.edu

#for local testing#####
#if the singularity.conf is right, then /vagrant should be auto-shared
#export WORK="/vagrant"
export WORK="$HOME/singularity-vm"
export GFF_DIR="$wORK/gffs" #also has genome.fa
########################

export OUT_DIR="$WORK/deseq_test"

#export MY_PARAMRUN="$HOME/launcher/paramrun"

[[ -d "$OUT_DIR" ]] && rm -rf $OUT_DIR/*

#-i "$WORK/genomes"

bash run.sh -g $GFF_DIR \
    -b $BAMS_DIR
    -t sample-sheet.txt \
    -o $OUT_DIR \
    -p 12
