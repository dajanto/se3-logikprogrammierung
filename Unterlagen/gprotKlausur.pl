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

% bild(Bild_Nr, Titel, Aufnahmedatum, Dateigroesse, Bewertung, Tags)
% album(Name, Bilder).

% haeufigkeit(regen, [regen, sonne, mond, regen], Anzahl).

haeufigkeit(_,[],0).
	
haeufigkeit(Tag, [H|T], Anzahl) :-
	% TODO 
	% Idee: append als cons benutzen
	
	haeufigkeit(Tag,T,Anzahl),
	%Tag = H,
	append(H,[_|H],Liste),
	length(Liste,Anzahl1).



% Endrekursiv
haeufigkeitEND(_,[],0).

haeufigkeitEND(Tag, [H|T], Anzahl) :-

	haeufigkeit(Tag, T, Anzahl1),
	% TODO Geht nur bei Regen = Regen, nicht bei Regen = Mond
	H = Tag,
	Anzahl is Anzahl1 + 1.
	

% Anzahl eines Tags in einer Liste
haeufigkeitHoehererOrdnung(Tag, Liste, Anzahl) :-
	
	findall(Tag,

	member(Tag,Liste),

	Tagliste),

	length(Tagliste, Anzahl).


% Alle Tags in einer Liste
tags(Liste) :-
	
	findall(Tags,
	(bild(_,_,_,_,_,Tagliste),
	member(Tags,Tagliste)),
	Liste).




% Liste mit Häufigkeiten aller Tags (rekursive Lösung)
verteilungRekursiv([],_,_).

verteilungRekursiv([H|T], TagListe, AnzahlListe) :-

	%tags(TagListe),
	%sort(TagListe,SortedListe),

	verteilungRekursiv(T,TagListe,AnzahlListe),
	haeufigkeitHoehererOrdnung(H,TagListe, Anzahl),
	append([Anzahl], AnzahlListe, AnzahlListe).




% Liste mit Häufigkeiten aller Tags
verteilung(Liste) :-

	% Idee: 
	% Pro Member der duplikatenfreien Liste schauen,
	% wie oft das Member in der nicht-duplikatenfreien Liste auftaucht
	% und eine entsprechende Liste erstellen

	tags(TagListe),
	sort(TagListe,SortedListe),

	findall(Anzahl,

	haeufigkeitHoehererOrdnung(Tag,TagListe,Anzahl),

	Liste).




		






% Aufgabe 5 






% Aufgabe 6 
