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

% bild(Bild_Nr, Titel, Aufnahmedatum, Dateigroesse, Bewertung, Tags)
% album(Name, Bilder).

einzigartigeTags(Nr) :-

	bild(Nr,_,_,_,_,Tags).
	

	









% Aufgabe 4 







% Aufgabe 5 






% Aufgabe 6 
