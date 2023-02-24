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
1 {paint(H,C) : color (C)} 1 :- house(H).
:- paint(H,C), paint (H',C), H!=H'.

% vecino para una casa
1 {paint(H,P) : person (P)} 1 :- house(H).
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

1 { at (H,T,V) : type (T,V) } 1 :- house(H), type(T,_).
:- at (H,T,V), at(H',T,V), H!=H'.

% restricciones:
:- at(H, person, brit), not at(H, color, red).
:- at(H, person, swede), not at(H, pet, dog).
:- at(H, person, dane), not at (H, drink, tea).
% esta restringe automaticamente el caso en el que la casa verde es 5
:- at(H, color, green), not at (H+1, color, white).
:- at(H, color, green), not at(H, drink, coffee).
:- at(H, tobacco, pall), not at(H, pet, bird).
:- at (H, color, yellow), not at (H, tobacco, dunhill).
at (3, drink, milk).
at (1, person, nor).
% sin predicado auxiliar
:- at (H, tobacco, blends), not  at(H+1, pet, cat), not at (H-1, pet, cat).
% con predicado vecino
neighbour (H,H+1) :- house(H), house(H+1).
neigbour (H,H-1) :- house(H), house(H-1).
neighbour (H,H') :- neighbour(H',H).
:- at (H,pet, horse), at (H', tobacco, dunhill),
    not neighbour (H,H').
:- at (H, tobacco, masters), not at (H, drink, beer).
:- at (H, person, german), not at (H, tobacco, prince).
:- at (H, person, norw), at (H', color, blue).
% con estas restricciones ya se puede satisfacer el problema con una unica solucion
:- at (H, tobacco, blends), at (H', drink, water),
    not neighbour (H, H').
