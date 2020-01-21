% Kostet etwas mehr - Beispiel

kostet_etwas_mehr(eis,lolli).
kostet_etwas_mehr(burger,eis).
kostet_etwas_mehr(schnitzel,burger).
kostet_etwas_mehr(sushi,schnitzel).

teurer(X,Y) :-
kostet_etwas_mehr(X,Y).

teurer(X,Y) :-
kostet_etwas_mehr(X,Z),
teurer(Z,Y).


% Fakultät berechnen

fak(0,1).

fak(Zahl,Result) :- 

Zahl > 0,
Zahl1 is Zahl - 1,
fak(Zahl1,Result1),
Result is Result1 * Zahl.





