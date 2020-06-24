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

% member und last haben ?-Argumente

% Richtungsabhängig

% findall

% Richtungsunabhängig

% !
% member
% last



% Aufgabe 3

min_max_list(Liste,Min,Max).

min_max_list(Liste,Min,Max) :-
	min_max_list_end(Liste,Min,Max,0,0).



min_max_listLinear([],Min,Max).

min_max_listLinear([H|T],Min,Max) :-

	(H < Min -> Min1 is H ;
	Min1 is Min),
	(H > Max -> Max1 is H ;
	Max1 is Max),
	min_max_listLinear(T,Min1,Max1).



min_max_listEnd([],Min,Max, MinResult, MaxResult) :-

	MinResult is Min,
	MaxResult is Max.

min_max_listEnd([H|T],Min,Max, MinResult, MaxResult) :-

	(H < Min -> Min1 is H ;
	Min1 is Min),
	(H > Max -> Max1 is H ;
	Max1 is Max),
	min_max_listEnd(T,Min1,Max1, MinResult, MaxResult).




% Aufgabe 4

% Keine Aufgaben vorhanden



% Aufgabe 5

% Ergebnis stimmt beim Debuggen, kein Output 
foobar(_,0, Result).

foobar([H|T],Count, Result) :-

	foobar(T,Count1, Result1),	
	length(Result,Index),
	nth0(Index, Result, H),
	Count is Count1 - 1.


%foobar(_,0, Liste,Liste).
%
%foobar([H|T],Count, Liste, Result) :-
%
%	foobar(T,Count, Liste1, Result),	
%	Count1 is Count - 1.



% Ergebnis stimmt beim Debuggen, kein Output 
foobarEnd(_, 0, Akku, Akku).

foobarEnd([H|T], Count, Akku, Result) :-

	append(Akku, [H], Akku_Update),
	Count1 is Count - 1,
	foobarEnd(T,Count1, Akku_Update, Result).
