# Yago Fernández Rego
# Adrián Rodríguez López

import sys

usage = """
        usage:\tencode.py <input> [output]
        if output file name not specified, 'input.txt'. will be created
        """

def convert (input_file, output_file) :

    if input_file.endswith (".txt") :
        grid = []

        # read results from input file
        with open (input_file, 'r') as input:
            for line in input:
                if line.strip():
                    row = list (map (int, line.split()))
                    grid.append (row)

        # write results on output file
        size = len (grid)
        with open (output_file, 'w+') as output :
            output.write ("size({}).\n".format (size))
            for i in range (size):
                for j in range (size):
                    if grid[i][j] != 0:
                        output.write ("number(({},{}),{}).\n".format (i, j, grid[i][j]))

    else :
        print ("unsupported input file")

if len (sys.argv) == 1:
    print (usage)
elif len (sys.argv) == 2:
    convert (sys.argv[1], "input.txt")
else:
    convert (sys.argv[1], sys.argv[2])
