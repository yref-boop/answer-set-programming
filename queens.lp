% 8 damas
row (1..8).
col (1..8).
cell (X,Y) :- col(X), row(Y).

8 {queen(X,Y):cell(X,Y)} 8.

:- queen(X,Y), queen(X',Y), X'!=X.
:- queen(X,Y), queen(X,Y'), Y'!=Y.

%simplifing:
1 {queen(X,Y):col(X)} 1 :- row(Y).
1 {queen(X,Y):row(Y)} 1 :- col(X).

%diagonals
%(en este caso concreto, una de las dos resticciones sobra
:- queen (X,Y), queen (X', Y'), |X-X'|=|Y-Y'|, X!=X'.
:- queen (X,Y), queen (X', Y'), |X-X'|=|Y-Y'|, Y!=Y'.

