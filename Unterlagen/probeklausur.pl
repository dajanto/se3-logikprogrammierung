
% Probeklausur Lösungsversuch

% 1.
%ausleihe(Signatur,Lesernummer,Ausleihdatum)
%vorbestellung(Signatur,Lesernummer)
%leser(Name,Vorname,Lesernummer,Adresse,Geburtsjahr)
%datum(J,M,T)

leser(sorglos,susi,1337,hein-fink-straße,1991).
leser(mann,manfred,8171,kröger-fink-weg,1978).

ausleihe(1818,1337,datum(1,1,1)).

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


% c)




