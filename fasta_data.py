import sys

def read_lines(file):
    lines_list = file.readlines()
    return lines_list

def count_seq(lines):
    seq_count = 0
    for line in lines:
        if line.startswith(">") == True:
            seq_count += 1
    return seq_count

def count_bp(lines):
    bp_count = 0
    for line in lines:
        line = line.strip()
        if line.startswith(">") == False:
            for char in line:
                bp_count += 1
    return bp_count

if __name__ == "__main__":
    fasta_file = open(sys.argv[1], "r")
    lines = read_lines(fasta_file)
    fasta_file.close()
    seq_count = count_seq(lines)
    bp_count = count_bp(lines)
    print("seq_count=" + str(seq_count))
    print("bp_count=" + str(bp_count))
