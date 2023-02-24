%size
#const size = 8.

row (1..size).
col (1..size).

% double parenthesis are consutructors (an anonymous function constructor, sorta)
node ((X, Y)) :- row(X), col(Y).
adj ((X, Y), (X+1, Y)) :- row(X), col(Y), col(Y+1).
adj ((X, Y), (X, Y+1)) :- row(X), col(Y), col(Y+1).
adj (A, B) :- adj (B, A).

size (size).
number ((cell), number).
seg ((cell_1), (cell_2)).

% decidir si se hacen dos caminos o uno

total (S) :- #sum{X, M: income (M,X)} = S.
