
% Erste Prädikatsaufgabe

inter([],_,[]).

inter([H1|T1], L2, [H1|Res]) :-
    member(H1, L2),
    inter(T1, L2, Res).

inter([_|T1], L2, Res) :-
    inter(T1, L2, Res).

test(X) :-

	inter([1,3,5,2,4],[6,1,2],X),!.


% min_max_list(Liste,Min,Max)
min_max_list([],Min,Max,MinAkk, MaxAkk) :-

	MinAkk is Min,
	MaxAkk is Max.


min_max_list([H|T],Min,Max, MinAkk, MaxAkk) :-

	(H > Max1 -> Max is H ;
	H < Min1 -> Min is H),
	min_max_list(T,Min1,Max1, MinAkk, MaxAkk).





foobar(T,0,Akku,Akku).

foobar([H|T],Y,Akku,Result) :-
	
	append(Akku,[H],Akku_Update),
	Y1 is Y - 1,
	foobar(T,Y1,Akku_Update,Result).

	


% bild(ID,Titel,Aufnahmedatum,Tagliste).
% album(ID,Bilderliste)
% Datum = YYYY-MM-TT

% Wie viele Bilder wurden 2015 aufgenommen?
%findall(ID,
%		(bild(ID,_,2015-_-_,_),
%		Liste),
%		length(Liste,Result).

% Welche Alben enthalten nur Bilder von 2015?
		%album(ID1,Bilderliste),
		%bild(ID,_,2015-_-_,_),
		%member(ID,Bilderliste)


% Welche Tags kommen nur einmal vor?
%bild(_,_,_,Tagliste),
%bild(_,_,_,Tagliste1),
%member(Tag,Tagliste),
%\+member(Tag,Tagliste1).



haeufigkeit(_,[],Anzahl). 

haeufigkeit(Element,[H|T],Anzahl) :-
	
	haeufigkeit(Element,T,Anzahl1),
	Anzahl1 is Anzahl + 1.




haeufigkeitEND(_,[],Akku,Akku).

haeufigkeitEND(Element,[H|T],Akku,Result) :-
	(H = Element -> Akku_Update is Akku + 1 ; 
	(H != Element -> Akku_Update is Akku + 0),
	haeufigkeitEND(Element,T,Akku_Update,Result). 




% Alle Tags in einer Liste 
alleTags(Liste) :-

	findall(Tag,
			(bild(_,_,_,Tagliste),
			member(Tag,Tagliste))
			Liste).



% Anzahl aller Tags
anzahlTags(Anzahl) :-

	alleTags(Liste),
	% sort(Liste,SortedListe) <-- für unique Tags
	length(Liste,Anzahl).






% subtag(Obertag, Subtag).
subtag(urlaub,sommerurlaub).
subtag(sommerurlaub,bootstour).
subtag(urlaub, winterurlaub).


oberbegriff(T1,T2) :-

	subtag(T1,T2).


oberbegriff(T1,T2) :-

	subtag(T1,T3),
	oberbegriff(T3,T2).



member07(X,Liste, Result) :-
	
	member(X,Liste) ;
	oberbegriff(X,Result).
		



% Closures braucht man in der Funktionalen Programmierung, um überhaupt Funktionen Höherer Ordnung möglich zu machen, also Funktionen an Funktionen zu übergeben. Beispielsweise (map (curry - 1) '(1 2 3)) oder (((curry - 1) 2).


% blubb prüft ob Liste x und y gleich sind

blubb([],_).

blubb([H|T],Liste) :-
	
	member(H,Liste),
	blubb(T,Liste).

% Unterschied ist, dass in Racket die booleschen Rückgabewerte explizit definiert werden müssen mit mehreren ifs. In Prolog genügt ein einfacher Member-Aufruf.



intersecten([],_,[]).

intersecten([H|T],L1,[H|Result]) :-

	member(H,L1),
	intersecten(T,L1,Result).

intersecten([_|T],L1,Result) :-

	intersecten(T,L1,Result).

% Verschattung stellt eine Gefahr in blockorientierten Programmiersprachen dar. Die Logikprogrammierung kennt dieses Problem nicht, da sie mit der Beschränkung des Gültigkeitsbereiches ein simples Skopusmodell verwendet.













