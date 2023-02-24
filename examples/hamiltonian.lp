vtx(1..4).
edge (1,2). edge(2,3). edge(2,4). edge(3,1). edge(3,4). edge(4,3). edge(4,1).

% lo siguiente podria y deberia estar en un fichero aparte
{in(X,Y)} :- edge(X,Y).

:- in(X,Y), in(X,Y'), Y!=Y'.
:- in(X,Y), in(X',Y), X!=X'.

%cierre recursivo
reach(X,Y) :- in(X,Y).
reach(X,Z) :- reach(X,Y), in (Y,Z).

:- vtx(X), vtx(Y), not reach(X,Y).
