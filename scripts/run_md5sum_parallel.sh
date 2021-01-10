nextflow run md5sum_parallel.nf \
 -profile tartu_hpc\
 --bamsPath "/gpfs/space/projects/GTEx/bam/*.bam"\
 --collate_size 100\
 --outdir './md5Sums'
