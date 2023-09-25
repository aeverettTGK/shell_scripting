#!/bin/bash

total_seq=0
total_bp=0
file_count=0

collect_fasta_data(){
    for file in *; do
        if [[ -f "$file" ]] && [[ "$file" == *.fasta ]]; then
            ((file_count++))
            output=$(python3 fasta_data.py $file)
            IFS=' ' read -r seq_count bp_count <<< "$output"
            total_seq=$((total_seq + seq_count))
            total_bp=$((total_bp + bp_count))
        elif [[ -d "$file" ]]; then
            $collect_fasta_da
        fi
    done
}

collect_fasta_data
echo $file_count > log.txt
echo $total_seq >> log.txt
echo $total_bp >> log.txt

if [ ! -d individual_fastas ]; then
    mkdir individual_fastas
fi

for file in *; do
    if [[ "$file" == *.fasta ]]; then
        python3 create_fasta.py $file
        mv *_individual.fasta ./individual_fastas
    fi
done
