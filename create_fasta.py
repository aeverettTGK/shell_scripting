import sys

def read_sequences(file):
    text = file.read()
    sequences = text.split(">")[1:]
    return sequences

def create_file(sequences):
    for sequence in sequences:
        header = sequence.split("\n")
        seq_id = header[0].replace(" ",'')
        file_name = "{}.fasta".format(seq_id)
        with open(file_name, "w") as output_file:
            output_file.write(sequence)

if __name__ == "__main__":
    fasta_file = open(sys.argv[1], "r")
    sequences = read_sequences(fasta_file)
    create_file(sequences)

