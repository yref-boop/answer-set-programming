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

% unidirectional segment used for graphical representation
segment (P,Q) :- edge (P,Q), P < Q.


% all edges must for a single linear loop, no crossing or branching is allowed

% check that, if node is used, it has two edges
used (P) :- edge (P,_).
    % used needen't be biyective because edge already is
    % used (P) :- edge (_,P).
:- used (P), #count {Q: edge (P,Q)} != 2.

% all numbered circles must be in a loop
ball (B) :- number (B,N), N != 0.
:- ball (B), not used (B).

% there must be only one loop
connected (X, Y) :- edge (X, Y).
connected (X, Z) :- connected (X, Y), edge (Y, Z).
:- ball (B), ball (B'), B' != B, not connected (B, B').
