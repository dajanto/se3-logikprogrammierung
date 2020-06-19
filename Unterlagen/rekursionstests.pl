% Linear
countList([],0).

countList([H|T],Count) :- 
	
	countList(T,Count1),
	Count is Count1 + 1.


sumsumlistlist([],0).

sumsumlistlist([H|T],Count) :- 
	
	sumsumlistlist(T,Count1),
	Count is Count1 + H.



% [regen,sonne,mond]
% haeufigkeit(regen,[regen,mond,sonne],Anzahl)
haeufigkeit(_,[],0).
haeufigkeit(Tag,[H|T],Anzahl) :-

	haeufigkeit(Tag,T,Anzahl1),
	(Tag = H -> Anzahl is Anzahl1 + 1 ;
	Anzahl is Anzahl1 + 0).


haeufigkeitEND(_,[], Anzahl ,Anzahl).
haeufigkeitEND(Tag,[H|T],Akku, Anzahl) :-

	(Tag = H -> Akku_Update is Akku + 1 ;
	Akku_Update is Akku + 0),
	haeufigkeitEND(Tag, T, Akku_Update, Anzahl).

haeufigkeitHO(Tag,Liste, Anzahl) :-
	findall(Tag,

	(member(Tag,Liste)),

	Liste2),
	length(Liste2,Anzahl).




% Endrekursiv
countListEND([],0).

countListEND([H|T],Count,Akku) :- 
	
	countListEND(T,Count1, Akku),
	Count is Count1 + 1.
	


sumEND([],Sum,Sum).

sumEND([H|T],Akku,Sum) :- 
	
	Akku_Update is Akku + H,
	sumEND(T, Akku_Update, Sum).
	


% Höhere Ordnung


