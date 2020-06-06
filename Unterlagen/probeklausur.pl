
% Probeklausur Lösungsversuch

% 1.
%ausleihe(Signatur,Lesernummer,Ausleihdatum)
%vorbestellung(Signatur,Lesernummer)
%leser(Name,Vorname,Lesernummer,Adresse,Geburtsjahr)
%datum(J,M,T)

leser(sorglos,susi,1337,hein-fink-straße,1991).
leser(sorglos,susi,1338,hein-fink-straße,1993).
leser(mann,manfred,8171,kröger-fink-weg,1978).
leser(mann,manfred,8172,kröger-fink-weg,1913).
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
%ausleihe(Signatur,Lesernummer,datum(T,M,J)),
%T < 7, 
%M < 1, 
%J < 2007.


% e)

anzahlLesernummernAelter60(Lesernummer, Anzahl) :-

	findall(

	Lesernummer,

	(leser(_,_,Lesernummer,_,Geburtsjahr),
	ausleihe(_,Lesernummer,_),
	Geburtsjahr < 1960),
	Liste),

	length(Liste,Anzahl).

% 2.

% a)

	% Aufgabenstellung ungenau
	%ordnung(D,D1) :- D @< D1.

% b)

differenz(datum(T,M,J), datum(T1,M1,J1), Differenz) :-

	TT is T - T1,
	MM is M*30 - M1 * 30,
	JJ is J * 360 - J1 * 360,
	Differenz is abs(TT+MM+JJ).


% d)

leihfrist(datum(T,M,J),Leihfrist,Lesernummer, Überschreitungsliste) :-

findall(Lesernummer,

(leser(_,_,Lesernummer,_,_),
ausleihe(_,Lesernummer,Ausleihdatum),
differenz(datum(T,M,J),Ausleihdatum, Differenz),
Differenz >= Leihfrist), 

Überschreitungsliste).


% e)

mahnungen(Lesernummer, datum(T,M,J), maxLeihfrist, Signaturenliste, Signaturenlistenlänge) :-

findall(Signatur,

(leihfrist(datum(T,M,J),maxLeihfrist,Lesernummer,Überschreitungsliste),
member(Lesernummer,Überschreitungsliste),
ausleihe(Signatur,Lesernummer,_)),

Signaturenliste),

length(Signaturenliste,Signaturenlistenlänge).


% 3.

% a)
% Nicht ganz richtig wahrscheinlich

mahnendeLeserGesamt(datum(T,M,J),Leihfrist,SortedList) :-

findall((Name,Vorname,Adresse,Signaturenlistenlänge,Signaturenliste),

(mahnungen(Lesernummer,datum(T,M,J),Leihfrist,Signaturenliste,Signaturenlistenlänge),
member(Lesernummer,Signaturenliste),
length(Signaturenliste,Signaturenlistenlänge),
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
länge([],0).
länge([_|T],N) :- 
	länge(T,N1),
	N is N1 + 1.

% TODO 
% [0,10,14,18,28,38,50,65,500]
%altersgruppen([],0).
%altersgruppen([_|Rest], Ergebnis) :-
%
%	anzahlLeserBis(_,2020,Altersgrenze, Ergebnis).
%
%	altersgruppen(Rest,Ergebnis).


% Beispielaufruf
% anzahlLeserBis(L,2020,60,Ergebnis).

anzahlLeserBis(Lesernummer, AktuellesJahr, Altersgrenze, Ergebnis) :-

findall(Lesernummer,

(leser(_,_,Lesernummer,_,Geburtsjahr),
ausleihe(_,Lesernummer,_),
Alter is AktuellesJahr - Geburtsjahr,
Alter < Altersgrenze),

Liste),
length(Liste,Ergebnis).



