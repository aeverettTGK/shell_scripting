#!/bin/bash

total_seq=0
total_bp=0

collect_fasta_data(){
    dir='$1'
    file_count=0
    for file in '$dir'; do
        if [[ -f $file ]]; then
            if $file == *.fasta; then
                output=$(python3 fasta_data.py '$file')
                file_count=$(($file_count + 1))
                seq_count=$(echo '$output' | awk '{print $1}')
                bp_count=$(echo '$output' | awk '{print $2}')
                total_seq=$(($total_seq + $seq_count))
                total_bp=$(($total_bp + $bp_count))
            fi
        elif [[ -d $file ]]; then
            count_subdir=$(collect_fasta_data "$file")
            file_count=$(($file_count + $count_subdir))
        fi
    done
    echo "$file_count"
}

target_directory="$(pwd)"

ffile_count=$(collect_fasta_data "$target_directory")


echo "FASTA files: $ffile_count" > log.txt
echo "Sequences: $total_seq" >> log.txt
echo "Base Pairs: $total_bp" >> log.txt



