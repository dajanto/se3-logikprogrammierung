% Aufgabe 1

% 1.
% append([a],[b,c],R).
% a ist keine Liste, wenn a eine Liste wäre, würde [1,2,3] herauskommen.
% --> false

% 2.
% K = [M|M],M=[a,b].	
% Scheinbar verhält sich der Tail anders als der Head. Die in den Tail eingefügte Liste besteht aus dessen Elementen, der Head bleibt eine Liste.
% --> K = [[a,b],a,b]

% 3.
% [A,B|C] = [a,b,c]
% ???
% --> A = a, B = b, C = [c]

% 4.
% X is 2, Y = 3 * X + 2
% X kriegt den numerischen Wert 2, Y wird ein Term zugewiesen und das X unifiziert mit der 2
% --> X = 2, Y = 3*2+2

% 5.
% [a,E,c] = [a] + [b,c]
% Nicht unifizierbar
% --> false


% Aufgabe 2

% a)
% Richtungsunabhängigkeit beschreibt, dass die Auswertungsreihenfolge im relationalem Programmierparadigma keine Rolle spielt. Wenn man beispielsweise in Prolog vom funktionalen Programmierparadigma Gebrauch macht, geht die Richtungsunabhängigkeit verloren.


% b)
% append([],[],Liste)

% c)

% append([1],[],Liste) liefert dasselbe Ergebnis wie
% append([],Liste,[1])


% d)
% TODO
% Richtungsunabhängigkeit für !, last, findall, member


% Aufgabe 3

% TODO
% Rekursionsaufgaben

% Aufgabe 4

% Keine Aufgaben vorhanden



% Aufgabe 5

foobar([],0).

foobar([_|T],Y) :-
	
	!, foobar(T,Y),
	Y is Y - 1.
