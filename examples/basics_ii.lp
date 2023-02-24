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



















