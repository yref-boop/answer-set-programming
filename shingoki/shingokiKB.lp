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
{edge (P, Q)} :- adjacent (P, Q).
% bidirectional segments are prefered
edge (Q, P) :- edge (P, Q).

% unidirectional segment used for graphical representation
segment (P, Q) :- edge (P, Q), P < Q.


% check that, if node is used, it has two edges
used (P) :- edge (P,_).
    % used needen't be biyective because edge already is
    % used (P) :- edge (_,P).
:- used (P), #count {Q: edge (P, Q)} != 2.

% all numbered circles must be in a loop
ball (B) :- number (B, N), N != 0.
:- ball (B), not used (B).

% get first ball
first (B) :- B = #min {B': ball (B')}.

% there must be only one loop
connected (X, Y) :- edge (X, Y).
connected (X, Z) :- connected (X, Y), edge (Y, Z).
:- ball (B), first (B'), B != B', not connected (B, B').

% Connected all edges with first ball. This way, we only have one loop
:- first(B), used(S), not connected(B,S).

% white (positive) circles must be passed through a straight line
horizontal (P) :- edge (P, (X,Y)), edge (P, (X',Y')), |Y-Y'| == 2.
vertical (P)   :- edge (P, (X,Y)), edge (P, (X',Y')), |X-X'| == 2.

straight (P) :- vertical (P).
straight (P) :- horizontal (P).

:- number (B, N), N > 1, not straight (B).

% black (negative) circles must be located in a corner
:- number (B, N), N < 0, straight (B).


% the number on each ball represents length of its two lines

% check if two points are on the same axis (+)
aligned_vertical ((X,Y), (X',Y)) :- edge ((X,Y), (X',Y)), number ((X,Y), _).
aligned_vertical ((X,Y), (X',Y)) :- edge ((X,Y), (P,Y)), aligned_horizontal ((X',Y), (P,Y)).

aligned_horizontal ((X,Y), (X,Y')) :- edge ((X,Y), (X,Y')), number ((X,Y), _).
aligned_horizontal ((X,Y), (X,Y')) :- edge ((X,Y), (X,P)), aligned_vertical ((X,Y'), (X,P)).

aligned (B, P) :- aligned_vertical (B, P).
aligned (B, P) :- aligned_horizontal (B, P).

% count itself
:- number (B, N), N > 1, #count {P: aligned (B, P)} != N.
:- number (B, N), -N > 1, #count {P: aligned (B, P)} != -N.
