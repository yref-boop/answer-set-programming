% install clingraph(pip)
% (graphviz fst)

% generar cartas de poker:
rango(2..10;as;j;q;k).
palo(diamante;trebol;corazon;pica).

% generar todas las posibles manos de poker (5):
5 {mano(R,P): rango(R),palo(P)} 5.

% escoger unicamente la info
#show mano/2.

% trios de ases que no sean full
% no se puede generar un numero de ases inferior a 2 (inclusive)
:- {mano(as,P):palo(P)} 2.
% no se puede generar mas de 3
:- 4 {mano(as,P):palo(P)}.

% limitar las parejas
:- mano(R,P),R!=as,mano(R,P'),P!=P'.

% sintaxis:
5 {mano(R,P): rango(R)} 5


% razonamiento no monotono
% programacion positiva:
p.
q.
r :- p,s.
s :- q.
a :- b,p.
b :- s,a.
a :- c.

% clingo presupone que si un atomo no se puede probar con este tipo, es falso
% closed wall assumption()
% para cambiar esto, se tienen que generar los grupos de atomos

% utilizando negaciones:
fill :- empty, not fire.
empty.

% añadiendo informacion para derivar fuegoo:
fill :- empty, not fire.
empty.
fire :- spark.
spark.
% asi todos los atomos se pueden derivar, en el caso anterior, fire siempre era falso ya quue no se podia

% conflict on rules
bellicose :- republican not pacifist.
pacifist :- quaker, not bellicose.
quaker.
republican.

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
:- queen (X,Y), queen (X', Y'), |X-X'|=|Y-Y'|, X!=X'
:- queen (X,Y), queen (X', Y'), |X-X'|=|Y-Y'|, Y!=Y'

%einstein's 5house riddle

% definir casas
house(1..5).
% definir vecinos
person(dane;swede;brit;norw;german).
%definir bebidas
drink(water;milk;beer;coffee;tea).
%definir colores
color(red;blue;green;yellow;white).
%mascotas
pet(horse;dog;fish;cat;bird).
%tobacco
tobacco(blends;prince;pall;masters;dunhill).

%color para cada casa
1 {paint(H,C) : color (C) 1 :- house(H).
:- paint(H,C), paint (H',C), H!=H'.

% vecino para una casa
1 {paint(H,P) : person (P) 1 :- house(H).
:- paint(H,P), paint (H',P), H!=H'.


% asi con todas -> simplificando 
% mismo conjunto de reglas para un grupo de predicados
% reificar?

% definicion de tipos:

house(1..5).

type (person,(dane;swede;brit;norw;german)).
type (drink,(water;milk;beer;coffee;tea)).
type (color,(red;blue;green;yellow;white)).
type (pet,(horse;dog;fish;cat;bird)).
type (tobacco,(blends;prince;pall;masters;dunhill)).

% generar casas:

1 { at (H,T,V) : type (T,V) } 1 :- house(H),Type(T,_).
:- at (H,T,V), at(H',T,V), H!=H'.

% restricciones:
:- at(H,color,red), not at(H,person,brit).
:- at(H,person,swede), not at(H,pet,dog).
