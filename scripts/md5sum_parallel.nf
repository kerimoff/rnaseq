#!/usr/bin/env nextflow
md5sum_file_chunks = Channel.fromPath(params.bamsPath).collate(params.collate_size)

process md5sum_chunk{
    publishDir "${params.outdir}/", mode: 'copy'
    memory '8 GB'
    cpus 1
    echo true

    input:
    file md5sum_files from md5sum_file_chunks

    output:
    file "*.tsv"

    script:
    md5sum_files_joined = md5sum_files.join(' ')
    // time_in_long = new java.util.Date().getTime()
    """
    md5sum $md5sum_files_joined >> ${md5sum_files[0]}.tsv
    """
}

workflow.onComplete { 
	println ( workflow.success ? "Done!" : "Oops ... something went wrong" )
}






