import sys, re

usage = """
        usage:\tencode.py <input> [output]
        if output file name not specified, 'results.txt'. will be created
        """

def decode (input_string, output_file):

    segments_pattern = r"segment\(\((\d+),(\d+)\),\((\d+),(\d+)\)\)"
    size_pattern = r"size\((\d+)\)"
 
    segments = []
    size = 0

    for match in re.findall (segments_pattern, input_string):
        x1, y1, x2, y2 = map (int, match)
        segments.append (((x1, y1), (x2, y2)))

    size = int (re.search (size_pattern, input_string).group (1))

    with open (output_file, 'w+') as output:
        for i in range (size):
            for j in range (size):
                print ("+", end = "", file = output)
                if j < (size - 1):
                    if ((i, j),(i, j + 1)) in segments:
                        print ("--", end = "", file = output)
                    else:
                        print ("  ", end = "", file = output)
            print ("", file = output)
            if i < (size - 1):
                for j in range (size):
                    if ((i, j),(i + 1, j)) in segments:
                        print ("|  ", end = "", file = output)
                    else:
                        print ("   ", end = "", file = output)
                print ("", file = output)


def get_result (input_file) :
    with open (input_file, 'r') as file:
        count = 0
        for line in file:
            count += 1
            if count == 5:
                print (line)
                return (line)


if len (sys.argv) == 1:
    print (usage)
elif len (sys.argv) == 2:
    decode (get_result (sys.argv[1]), "results.txt")
else:
    decode (get_result (sys.argv[1]), sys.argv[2])
