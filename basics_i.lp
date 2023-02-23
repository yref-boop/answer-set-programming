 1. on weekends i don't watch tv
% 2. i'm happy when it rains, except in the weekend
% 3. im watching tv but i'm not happy
% C. it is not raining

% choice rules
{w;tv;h;r}.


% constraints

% 1. w -> tv
:- w, tv.

% 2. r /\ w -> h
:- r, not w, not h.

% 3. tv /\ ¬h
:- not tv.
:- h.

%Answer: 1
%tv
%SATISFIABLE

% thus, the initial conclusion is satisfiable


% for more complex values, we need to ensure no counterexamples exist
% this can be done by _reductio ad absurdum_ negating the conclusion

% ¬(¬r)
:- r



%% LADY & THE TIGER

{t1;t2;p1;p2}.

% p1 <-> (¬t1 /\ t2)
:- not t1, t2, not p1.
:- p1, t1.
:- p1, not t2.

% (t1 /\ ¬t2) \/ (¬t1 /\ t2) <-> p2
% t1 xor t2 <-> p2
:- t1, not t2, not p2.
:- t2, not t1, not p2.
:- p2, t1, t2.
:- p2, not t1, not t2.

% p1 xor p2
:- p1, p2.
:- not p1, not p2.



%% XOR

% X {;;} Y.
% X -> minimum, Y -> maximum


1 {d1;d2;d3} 1.
1 {p1,p2,p3} 1.

% d1 <-> p1
% d2 <-> p2
% ¬d2 <-> p3


3 doors problem
2 {t1;t2;t3} 2.
{p1,p2,p3} 1.

% p1 -> t1
:- p1, not t1.
:- t1, not p1.

% p2 <-> ¬t2
:- p2, t2.
:- not p2, not t2.

% p3 <-> t2
:- p3, not t2.
:- t2, not p3.

%% LUZ
{upa0; upb0; upc0; light0}.
{upa1; upb1; upc1; light1}.
1 {ta; tb; tc} 1.

%estado inicial
upa0. upb0. upc0. light0.

% accion a ejecutar
ta.

% efecto de las acciones (effect axiom)
% ta /\ upa0 -> ~ upa1
:- ta, upa0, upa1.
:- ta, not upa0, not upa1.
:- ta, light0, light1.
:- ta, not light0, not light1.

:- tb, upb0, upb1.
:- tb, not upb0, not uba1.
:- tb, light0, light1.
:- tb, not light0, not light1.

:- tc, upc0, upc1.
:- tc, not upc0, not upc1.
:- tc, light0, light1.
:- tc, not light0, light1.

% frame axioms
:- ta, upb0, not upb1.
:- ta, not upb0, upb1.
:- ta, upc0, not upc0.
:- ta, not upc0, upc0.

:- tb, upa0, not upa1.
:- tb, not upa0, upa1.
:- tb, upc0, not upc0.
:- tb, not upc0, upc0.

:- tc, upb0, not upb1.
:- tc, not upb0, upb1.
:- tc, upca, not upa0.
:- tc, not upa0, upa0.

% para simplificat -> parametrizar
{up(a,0); up(b,0); up(c,0); light0}.
{upa1; upb1; upc1; light1}.
1 {ta; tb; tc} 1.

# Capital letters -> variables that could be changed by anything defifned as object ()
# types ->  name(object).
switch(a). switch(b). switch(c).

switch (X), t(X), up(X,0), up(X,1).

#show 

#definir conjuntos de forma no especifica:
{up(X,0) : switch(X)}.

time(0). time
