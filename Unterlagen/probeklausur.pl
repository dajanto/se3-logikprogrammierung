
% Probeklausur Lösungsversuch

% 1.
%ausleihe(Signatur,Lesernummer,Ausleihdatum)
%vorbestellung(Signatur,Lesernummer)
%leser(Name,Vorname,Lesernummer,Adresse,Geburtsjahr)
%datum(J,M,T)

leser(sorglos,susi,1337,hein-fink-straße,1950).
leser(sorglos,susi,1337,hein-fink-straße,1950).
leser(sorglos,susi,1338,hein-fink-straße,1933).
leser(mann,manfred,8171,kroeger-fink-weg,1978).
leser(mann,manfred,8172,kroeger-fink-weg,1913).
ausleihe(123,1337,datum(1,1,1)).
ausleihe(1818,1338,datum(1,1,1)).
ausleihe(123,8171,datum(1,1,1)).
ausleihe(1818,8172,datum(1,1,1)).

vorbestellung(bug17456,8171).

% a)

%leser(sorglos,susi,Lesernummer,_,_).

% b)

%vorbestellung(bug17456,Lesernummer),
%leser(Name,Vorname,Lesernummer,_,_).

% c)

%leser(_,_,56245,_,_),
%ausleihe(Signatur,56245,_),
%\+ vorbestellung(Signatur,_).

% d)

%leser(Name,Vorname,Lesernummer,Adresse,_),
%ausleihe(Signatur,Lesernummer,datum(J,M,T)),
%(J < 2007 ;
%(T < 7, 
%M = 1,
%J = 2007)).


% e)

anzahlLesernummernAelter60(Anzahl) :-

	findall(

	Lesernummer,

	(leser(_,_,Lesernummer,_,Geburtsjahr),
	ausleihe(_,Lesernummer,_),
	Geburtsjahr < 1960),
	Liste),

	sort(Liste,Listeliste),
	length(Listeliste,Anzahl).

% 2.

% a)

% Aufgabenstellung ungenau, Lösung nur notiert
ordnung(D,D1) :- 

	D @< D1.

% b)

differenz(datum(T,M,J), datum(T1,M1,J1), Differenz) :-

	TT is T - T1,
	MM is M * 30 - M1 * 30,
	JJ is J * 360 - J1 * 360,
	Differenz is abs(TT+MM+JJ).


% d)

leihfrist(datum(T,M,J),Leihfrist,Lesernummer, Ueberschreitungsliste) :-

	findall(Lesernummer,

	(leser(_,_,Lesernummer,_,_),
	ausleihe(_,Lesernummer,Ausleihdatum),
	differenz(datum(T,M,J),Ausleihdatum, Differenz),
	Differenz >= Leihfrist), 

	Ueberschreitungsliste).


% e)

mahnungen(Lesernummer, datum(T,M,J), maxLeihfrist, Signaturenliste, Signaturenlistenlaenge) :-

	findall(Signatur,

	(leihfrist(datum(T,M,J),maxLeihfrist,Lesernummer,Ueberschreitungsliste),
	member(Lesernummer,Ueberschreitungsliste),
	ausleihe(Signatur,Lesernummer,_)),

	Signaturenliste),

	length(Signaturenliste,Signaturenlistenlaenge).


% 3.

% a)
% Nicht ganz richtig wahrscheinlich

mahnendeLeserGesamt(datum(T,M,J),Leihfrist,SortedList) :-

	findall((Name,Vorname,Adresse,Signaturenlistenlaenge,Signaturenliste),

	(mahnungen(Lesernummer,datum(T,M,J),Leihfrist,Signaturenliste,Signaturenlistenlnge),
	member(Lesernummer,Signaturenliste),
	length(Signaturenliste,Signaturenlistenlnge),
	leser(Name,Vorname,Lesernummer,Adresse,_)
	),

	Liste),
	sort(Liste,SortedList).


% b)

%ausleihe(Signatur,Lesernummer,Ausleihdatum)
%vorbestellung(Signatur,Lesernummer)
%leser(Name,Vorname,Lesernummer,Adresse,Geburtsjahr)
%datum(J,M,T)

% Rekursives Beispiel
laenge([],0).

laenge([_|T],N) :- 
	laenge(T,N1),
	N is N1 + 1.

% TODO 
% [0,10,14,18,28,38,50,65,500]
%altersgruppen([],0).  %
%altersgruppen([_|Rest], Ergebnis) :-
%
%	anzahlLeserBis(_,2020,Altersgrenze, Ergebnis).
%
%	altersgruppen(Rest,Ergebnis).


% Beispielaufruf
% anzahlLeserBis(L,2020,60,Ergebnis).
% Hilfsfunktion für den rekursiven Aufruf

anzahlLeserBis(Lesernummer, AktuellesJahr, Altersgrenze, Ergebnis) :-

	findall(Lesernummer,

	(leser(_,_,Lesernummer,_,Geburtsjahr),
	ausleihe(_,Lesernummer,_),
	Alter is AktuellesJahr - Geburtsjahr,
	Alter < Altersgrenze),

	Liste),
	length(Liste,Ergebnis).




% Rekursionstests

% Liste rekurisv abschneiden
listeAbschneiden([],0).  

listeAbschneiden([H|T], Ergebnis) :-
	listeAbschneiden(T,Ergebnis).


% Länge einer Liste ermitteln 
laengeEinerListe([],0).  

laengeEinerListe([H|T], Ergebnis) :-
	laengeEinerListe(T,Ergebnis1),
	Ergebnis is Ergebnis1 + 1.


% Liste addieren
sumList([],0).  

sumList([H|T], Ergebnis) :-
	sumList(T, Ergebnis1),
	Ergebnis is Ergebnis1 + H.


% Beispiele für Head/Tail-Getter
gibHead([Head|_],Head).

gibTail([_|Tail],Tail).




% 4.

p1([],[]).
p1([A,_|X],[A,_|Y]) :- p1(X,Y).

p2([],[]).
p2([A],[A]).
p2([A,_|X],[A,_|Y]) :- p2(X,Y).

p3([],[]).
p3([_],[]).
p3([A,_|X],[A,_|Y]) :- p3(X,Y).


% a)

% b)

% c)

% d)



% Racket-Funktion nach Prolog übersetzen
% Übernehme die ersten n Stellen einer Liste, schneide den Rest ab
uebernehmeStellen([],0).

uebernehmeStellen([H|T], Count) :- 
	
	append(H,[],Liste),
	uebernehmeStellen(T,Count),
	Count is Count - 1.

	
	







