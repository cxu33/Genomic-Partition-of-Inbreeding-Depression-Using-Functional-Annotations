#!/bin/sh
#BATCH --job-name="FILTERVAR"      #name of the job submitted
#SBATCH -p mem            #name of the queue you are submitting job to
#SBATCH -N 1                 #number of nodes in this job
#SBATCH -n 10                 #number of cores/tasks in this job, you get all 20 cores with 2 threads per core with hyper-threading
#SBATCH --mem-per-cpu 20GB
#SBATCH -t 24:00:00           #time allocated for this job hours:mins:seconds
#SBATCH -o "stdout.%j.%N"     # standard out %j adds job number to output file name and %N adds the node name
#SBATCH -e "stderr.%j.%N"     #optional, it prints out standard error
/project/dairyxbreed/chang.xu/plink2 --bfile seq_filtered_250k.merged --keep /90daydata/shared/chang.xu/jer_cowbull_cleaned_addedid_chip_bfile/keep_mky_F.txt --make-bed --cow --out 250k_Jercow_mky
/project/dairyxbreed/chang.xu/plink --bfile /90daydata/shared/chang.xu/jer_cowbull_cleaned_addedid_chip_bfile/Jercow_mky --bmerge 250k_Jercow_mky --cow --make-bed --out AF_250k_Jercow_mky
/project/dairyxbreed/chang.xu/plink --bfile AF_250k_Jercow_mky --ibc --cow --out AF_250k_Jercow_mky
perl make_snp_info.pl AF_250k_Jercow_mky.bim /90daydata/shared/chang.xu/annot/intron.annot.txt intron_AF_250k_Jercow_mky
perl make_snp_info.pl AF_250k_Jercow_mky.bim /90daydata/shared/chang.xu/annot/gerp.annot.txt gerp_AF_250k_Jercow_mky
perl make_snp_info.pl AF_250k_Jercow_mky.bim /90daydata/shared/chang.xu/annot/promoter.annot.txt promoter_AF_250k_Jercow_mky
perl make_snp_info.pl AF_250k_Jercow_mky.bim /90daydata/shared/chang.xu/annot/utr.annot.txt utr_AF_250k_Jercow_mky
perl make_snp_info.pl AF_250k_Jercow_mky.bim /90daydata/shared/chang.xu/annot/cds.annot.txt cds_AF_250k_Jercow_mky
/project/dairyxbreed/chang.xu/plink2 --bfile AF_250k_Jercow_mky --allow-extra-chr --cow --extract-col-cond utr_AF_250k_Jercow_mky.snp_info.csv 3 1 1 --extract-col-cond-match 1 --make-bed --out AF_250k_Jercow_mky_utr
/project/dairyxbreed/chang.xu/plink2 --bfile AF_250k_Jercow_mky --allow-extra-chr --cow --extract-col-cond cds_AF_250k_Jercow_mky.snp_info.csv 3 1 1 --extract-col-cond-match 1 --make-bed --out AF_250k_Jercow_mky_cds
/project/dairyxbreed/chang.xu/plink2 --bfile AF_250k_Jercow_mky --allow-extra-chr --cow --extract-col-cond promoter_AF_250k_Jercow_mky.snp_info.csv 3 1 1 --extract-col-cond-match 1 --make-bed --out AF_250k_Jercow_mky_promoter
/project/dairyxbreed/chang.xu/plink2 --bfile AF_250k_Jercow_mky --allow-extra-chr --cow --extract-col-cond gerp_AF_250k_Jercow_mky.snp_info.csv 3 1 1 --extract-col-cond-match 1 --make-bed --out AF_250k_Jercow_mky_gerp
/project/dairyxbreed/chang.xu/plink2 --bfile AF_250k_Jercow_mky --allow-extra-chr --cow --extract-col-cond intron_AF_250k_Jercow_mky.snp_info.csv 3 1 1 --extract-col-cond-match 1 --make-bed --out AF_250k_Jercow_mky_intron
/project/dairyxbreed/chang.xu/plink --bfile AF_250k_Jercow_mky_cds --ibc --cow --out AF_250k_Jercow_mkyd_cds_ibc
/project/dairyxbreed/chang.xu/plink --bfile AF_250k_Jercow_mky_gerp --ibc --cow --out AF_250k_Jercow_mky_gerp_ibc
/project/dairyxbreed/chang.xu/plink --bfile AF_250k_Jercow_mky_utr --ibc --cow --out AF_250k_Jercow_mky_utr_ibc
/project/dairyxbreed/chang.xu/plink --bfile AF_250k_Jercow_mky_promoter --ibc --cow --out AF_250k_Jercow_mky_promoter_ibc
/project/dairyxbreed/chang.xu/plink --bfile AF_250k_Jercow_mky_intron --ibc --cow --out AF_250k_Jercow_mky_intron_ibc
