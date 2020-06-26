
% zeitschrift (ID, Name, PreisFürdenLaden, PreisFürdenKunden,Anzahl bestellte Exemplare)
zeitschrift(1, bild, 10, 15, 22).
zeitschrift(2, dieZeit, 11, 16, 10).
zeitschrift(3, frankfurterAllgemeine, 7, 13, 3).
zeitschrift(4, dieWelt, 10, 15, 0).
zeitschrift(5, suddeutscheZeitung, 10, 15, 33).
zeitschrift(6, heinzKunst, 10, 15, 33).

% verkauft(ID, Jahr, Woche, AnzahlVerkaufteExemplare)
verkauft(1, 2020, 1, 3).
verkauft(1, 2019, 2, 3).
verkauft(2, 2010, 11, 5).
verkauft(3, 2015, 4, 7).
verkauft(6, 2015, 4, 1).
verkauft(2, 2015, 4, 1).
verkauft(7, 2015, 4, 1).




% 1.Wieviele Zeitschriften wurden insgesamt verkauft

anzahlVerkauftInsgesamt(Summe) :-

	findall(AnzahlVerkaufteExemplare,

			verkauft(_,_,_,AnzahlVerkaufteExemplare),

			Liste
			),
	sumlist(Liste,Summe).

% 2. Wieviele Zeitschriften wurden im Jahr 2019 verkauft

anzahlVerkauft2019(Summe) :-

	findall(AnzahlVerkaufteExemplare,

			verkauft(_,2019,_,AnzahlVerkaufteExemplare),

			Liste
			),
	sumlist(Liste,Summe).


% 3. Welche Zeitschriften wurden letztes Jahr verkauft

welcheZeitschriftenLetztesJahr(AktuellesJahr,ZID) :-

	LetztesJahr is AktuellesJahr - 1,
	verkauft(ZID,LetztesJahr,_,_).


% 4. Welche Zeitschriften wurden gar nicht verkauft

zeitschriftUnverkauft(ZID) :-

	zeitschrift(ZID,_,_,_,_),
	\+verkauft(ZID,_,_,_).


% 5. Welche Zeitschriften wurden nur 1 mal verkauft

zeitschriftEinmal(ZID) :-

	  findall(ZID,
        verkauft(ZID,_,_,1),
        L1),
		member(ZID,L1). 

% 6. Welche Zeitschriften wurden in mehreren Jahren verkauft

mehrereJahre(ZID) :-

	verkauft(ZID, Jahr, _, _),
	verkauft(ZID, Jahr1,_,_),
	Jahr1 =\= Jahr.


% 7. Welche Zeitschriften wurden bestellt aber nicht verkauft?

bestelltAber(ZID) :-

	zeitschrift(ZID,_,_,_,AnzahlBestellungen),
	\+verkauft(ZID,_,_,_),
	AnzahlBestellungen > 0.




% Vektor: [ 1:2 , 2:3 , 3:4 , 5:0 ]

skalarprodukt([],[], Akku, Result) :-
	sumlist(Akku,Summe),
	Result is Summe.

skalarprodukt([H|T],[H1|T1], Akku, Result) :-
	
	X is H * H1,
	append([X],Akku,Akku_Update),
	skalarprodukt(T,T1,Akku_Update,Result).



vektorToList(Vektor,List) :-

	vektorToList1(Vektor,[],List).


vektorToList1([],Acc,Acc).

vektorToList1([H|T],Acc,List) :-

	_:X = H,
	append(Acc,[X],Acc_Update),
	vektorToList1(T,Acc_Update,List).


betragEnd(Vektor,Betrag):-

	vektorToList(Vektor,List),
	betragEnd1(List,0,Betrag).


betragEnd1([],Acc,Betrag) :-
	Betrag is sqrt(Acc).

betragEnd1([H|T],Acc,Betrag) :-

	X is H * H,
	Acc_Update is Acc + X,
	betragEnd1(T,Acc_Update,Betrag). 


betragHO(Liste, Betrag) :-

	maplist([X,Y]>>(Y is X*X),Liste,Liste1),
	sumlist(Liste1,Summe1),
	Betrag is sqrt(Summe1).


kosinus(U,V,Kosinus) :-
	skalarprodukt(U,V,[],R),
	betragHO(U,J),
	betragHO(V,K), 
	JJ is J,
	KK is K,
	D is J * K,
	Kosinus is R / D.

% 4.

% 1.
% Richtungsunabhängigkeit ist ...

% 2.

% append([], Ys, Ys).
% append([X|Xs], Ys, [X|Zs]) :- append(Xs, Ys, Zs).

% 3.
% append([1,2],[3],Liste).
% oder
% append([1,2],Liste,[1,2,3]).

% 4.
% RU
% member/last

% NRU
% findall/!



% 5.


% 1.

% Special Form Operators sind cond, if, define, let, quote. SPO leiten ein Special Form Expression ein und sorgen dafür, dass die Auswertungsreihenfolge von der Norm abweicht.

% 2.


% 3.

% define ist ein Special Form Operator und somit vordefiniert, insofern ist es nicht ratsam, ihn neu zu definieren, da das Outcome höchstwahrscheinlich nicht dem entspricht, was man sich vorstellt.

% 4.
% <Racket-Ausdrücke>

% 5.
% <Racket-Funktion>


