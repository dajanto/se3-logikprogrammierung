% Aufgabe 2 

% 1.
% R = [3,1,2,3]

% 2.
% false 

% 3.
% R is 1+2+3+4 = 10

% 4.
% K = 1, L = [] gemäß Prolog-Listendefinition

% 5.
% false 


% Aufgabe 3 

% bild(Bild_Nr, Titel, Aufnahmedatum, Dateigroesse, Bewertung, Tags)
% album(Name, Bilder).

bild(16273, 'Schietwetter', 2018-4-15, 1363435, 3, [paula, regen, urlaub]).
bild(15256, 'Bootsfahrt', 2018-7-26, 1737264, 5, [anne, sonne]).
bild(73633, 'Schietwetter', 2018-5-1, 1762831, 7, []).
bild(73634, 'Schietwetter', 2018-5-1, 1762831, 4, [regen, anne]).
bild(73635, 'Schietwetter', 2019-4-1, 1762837, 7, [regen, anne]).

album('Album 1', [16273,18247, 14724, 18274, 58194]).
album('Album 2', [16273,17287, 18237, 17842, 17298, 15272]).
album('Album 3', [16273, 15256]).

subtag(urlaub, winterurlaub).
subtag(urlaub, sommerurlaub).
subtag(sommerurlaub, bootstour).

% 1.
wievieleBilder2018(Anzahl) :-

	findall(Nr,
	(bild(Nr,_,2018-_-_,_,_,_)),
	Liste),
	length(Liste,Anzahl).


% 2.
welcheAlbenLetztesJahr(Name) :-
	album(Name,Bilder),
	bild(Nr,_,2018-_-_,_,_,_),
	member(Nr,Bilder).


% 3.
welcheBilderKeineTags(Nr) :-
	bild(Nr,_,_,_,_,Tags),
	length(Tags,L),
	L = 0.



% 4.

welcheBilderInMehrerenAlben(Nr) :-

	bild(Nr,_,_,_,_,_),

	album(Name,Bilder),
	album(Name1,Bilder1),

	member(Nr,Bilder),
	member(Nr,Bilder1),

	Name1 \= Name.


% 5.

% TODO
einzigartigeTags(Nr) :-

	bild(Nr,_,_,_,_,Tags),
	bild(Nr1,_,_,_,_,Tags1),

	member(Tag, Tags),
	not(member(Tag, Tags1)),

	Nr \= Nr1.

	




% Aufgabe 4 

% 1.

% bild(Bild_Nr, Titel, Aufnahmedatum, Dateigroesse, Bewertung, Tags)
% album(Name, Bilder).

% haeufigkeit(regen, [regen, sonne, mond, regen], Anzahl).


% Anzahl eines Tags in einer Liste (linearrekursiv)
haeufigkeit(_,[],0).
	 
haeufigkeit(Tag, [H|T], Anzahl) :-

	% TODO 
	% Idee: append als cons benutzen?
	
	haeufigkeit(Tag,T,Anzahl1),
	length(Liste,Anzahl1).


% Anzahl eines Tags in einer Liste (endrekursiv)
haeufigkeitEND(_,[],0).

haeufigkeitEND(Tag, [Tag|T], Anzahl) :-

	% TODO 

	haeufigkeit(Tag, T, Anzahl1),
	H = Tag,
	Anzahl is Anzahl1 + 1.
	

% Anzahl eines Tags in einer Liste
haeufigkeitHoehererOrdnung(Tag, Liste, Anzahl) :-
	
	findall(Tag,

	member(Tag,Liste),

	Tagliste),

	length(Tagliste, Anzahl).



% 2.


% Alle Tags in einer Liste
tags(Liste) :-
	
	findall(Tags,
	(bild(_,_,_,_,_,Tagliste),
	member(Tags,Tagliste)),
	Liste).



wiederholen123([],ReversedListe).
wiederholen123([H|T],ReversedListe) :-
	wiederholen123(T,ReversedListe),
	append(T,H,Liste).



reverse([],Akku,Akku).
reverse([H|T],Akku, Output) :-

	append([H], Akku, Akku_Update),
	reverse(T, Akku_Update, Output).

% 3.

% Liste mit Häufigkeiten aller Tags
verteilung(_,[], Akku, Akku). 

verteilung(TagListe, [H|T], Akku, Result) :-

	haeufigkeitHoehererOrdnung(H, TagListe, Anzahl),
	append([(H,Anzahl)], Akku, Akku_Update),
	verteilung(TagListe, T, Akku_Update, Result).


verteilungAufruf(TagListe,SortedListe,Akku,Result) :-	

	tags(TagListe),
	sort(TagListe,SortedListe),
	verteilung(TagListe,SortedListe,Akku,Result).



% Aufgabe 5 

% 1.

%subtag(urlaub, winterurlaub).
%subtag(urlaub, sommerurlaub).
%subtag(sommerurlaub, bootstour).

% Bestimme ob T1 Oberbegriff von T2 ist
oberbegriff(T1,T2) :- 
	subtag(T1,T2).

oberbegriff(T1,T2) :-
	subtag(T1,T3),
	oberbegriff(T3,T2).
	

% 2.

% TODO 
%memberMod(X,Y) :-
%	member(X,Y),
%	oberbegriff(Y,X).


member05(Tag1,Result) :-

    findall(Unterbegriffe,

            oberbegriff(Tag1,Unterbegriffe),

            L1),
    member(Result,L1).

member06(T1,L1) :-

    findall(Unterbegriffe,

            oberbegriff(T1,Unterbegriffe),

            L2),

	sort(L2,SortedList),

	member07(L2, L1).


member07([], L1, Akku, Akku).

member07([H|T], L1, Akku, Result) :-

	member(H,L1),
	member07(T, L1, Akku_Update, Result).


member010([], L1, false).

member010([H|T], L1, Result) :-

	!,(member(H,L1) -> Result = true),
	member010(T, L1, Result). 










% 3.




% Aufgabe 6 

% Siehe probeklausur.rkt für Racketkram

sum_list_rekursiv([], 0).

sum_list_rekursiv([H|T], Summe) :-

	sum_list_rekursiv(T,Summe1),
	Summe is Summe1 + H.

% oder MEMEiger 
sum_list(Liste,Summe) :- 
	sumlist(Liste,Summe).
