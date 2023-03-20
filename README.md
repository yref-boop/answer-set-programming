
### shingoki problem
shingoki is a puzzle that consists in drawing segments among points in a grid of M x N so that all segments form a single, cyclic path
some grid points contain numbers that can be either black or white & the puzzle has some constraints:
- all edges must for a single linear loop, no crossing or branching is allowed
- the loop must pass through all numbered circles
- white circles must be passed through a straight line
- black circles must always be in a turn
- the number in each circle must be the sum of the lengths of the 2 straight line segments going through that numbered circle

[online shingoki example](https://www.puzzle-shingoki.com/)

in our case we can assume that the number of rows & columns coincide (all grids are square grids of N x N, where N >= 0)

### code structure
#### knowledge base (shingokiKB.lp)
encode the shingoki problem as an ASP program that solves the puzzle for any instance

#### encoder (encode.py)
python program that takes the shingokiX.txt file as an input and creates an instance file describing the instance as a set of ASP facts

this instance file cannot contain rules or constraints

execution example:
```python3 encode.py <shingoki1.txt> shingoki1.lp```

#### decoder (decode.py)
python program that translates back the answer set into a complete shingoki solution, printing the result in standard output

the result should be written as follows:
- show a '+' in each empty grid point
- show lines made of '|' & '-' displaying the connections

execution example:
```cligo shingokiKB.lpl shingokii1.lp | python decode.py > solution1.txt```
