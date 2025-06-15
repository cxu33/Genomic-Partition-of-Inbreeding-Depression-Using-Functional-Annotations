#!/bin/sh
#BATCH --job-name="REML"      #name of the job submitted
#SBATCH -p short            #name of the queue you are submitting job to
#SBATCH -N 1                 #number of nodes in this job
#SBATCH -n 10                 #number of cores/tasks in this job, you get all 20 cores with 2 threads per core with hyper-threading
#SBATCH --mem-per-cpu 10GB
#SBATCH -t 24:00:00           #time allocated for this job hours:mins:seconds
#SBATCH -o "stdout.%j.%N"     # standard out %j adds job number to output file name and %N adds the node name
#SBATCH -e "stderr.%j.%N"     #optional, it prints out standard error
/90daydata/shared/chang.xu/slemm-v0.89.7-x86_64-linux/slemm --reml --max_herit 0.3 --phenotype_file pheno_mky_f.csv --bfile /90daydata/shared/chang.xu/jer_cowbull_cleaned_addedid_chip_bfile/Jercow_mky --trait Milk --covariate_file fhat3.csv --covariate_name Fg --lrt --snp_info_file /90daydata/shared/chang.xu/chip_snp_info.csv --out Milk_reml_null --num_threads 36
/90daydata/shared/chang.xu/slemm-v0.89.7-x86_64-linux/slemm --reml --max_herit 0.3 --phenotype_file pheno_mky_f.csv --bfile /90daydata/shared/chang.xu/jer_cowbull_cleaned_addedid_chip_bfile/Jercow_mky --trait Protein --covariate_file fhat3.csv --covariate_name Fg --lrt --snp_info_file /90daydata/shared/chang.xu/chip_snp_info.csv --out Protein_reml_null --num_threads 36
/90daydata/shared/chang.xu/slemm-v0.89.7-x86_64-linux/slemm --reml --max_herit 0.3 --phenotype_file pheno_mky_f.csv --bfile /90daydata/shared/chang.xu/jer_cowbull_cleaned_addedid_chip_bfile/Jercow_mky --trait Fat --covariate_file fhat3.csv --covariate_name Fg --lrt --snp_info_file /90daydata/shared/chang.xu/chip_snp_info.csv --out Fat_reml_null --num_threads 36
