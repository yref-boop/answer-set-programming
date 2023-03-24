% grid definition
row (0..N-1) :- size (N).
column (0..N-1) :- size (N).
point ((X, Y)) :- row (X), column (Y).

% check if two nodes are next to eachother
adjacent ((X, Y), (X+1, Y)) :- row (X), column (Y), row (X+1).
adjacent ((X, Y), (X, Y+1)) :- row (X), column (Y), column (Y+1).
    % adjacent needen't be bijective, since edge already is
    % adjacent (A, B) :- adjacent (B, A).


% generate segments between adjacent points
{edge (P,Q)} :- adjacent (P,Q).
% bidirectional segments are prefered
edge (Q,P) :- edge (P,Q).


% check that, if node is used, it has two edges
used (P) :- edge (P,_).
    % used needen't be biyective because edge already is
    % used (P) :- edge (_,P).
:- used (P), #count {Q: edge (P,Q)} != 2.

segment (P,Q) :- edge (P,Q), P < Q.

%ensure only one cycle
% implement reach ((X,Y), #min bolas).

%total (S) :- #sum{X, M: income (M,X)} = S.

% linear loops (no branching or crossing)

% loop must go through all numbered circles
ball (B) :- number (B,N), N != 0.
:- ball (B), not used (B).

% white circles must be passed through a straight line
% si algo esta alineado y tengo una arista a ese punto siguiendo la misma linea, entonces ese tmb esta alineado

%aligned (B, P) :- ball (B), edge (B,P).

% black circles must be in a corner of a turn

% the number on each circle must be the sum of the lengths of the 2 straight segments going out that circle
