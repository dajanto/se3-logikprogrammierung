% tag(TagesID,Tag,Monat,Jahr,Wochentag,Feiertag)


tag(1,29,10,1991,montag,ja).
tag(2,1,5,1991,mittwoch,ja).
tag(3,24,12,1997,samstag,ja).
tag(4,15,7,2001,montag,nein).
tag(5,10,1,2020,donnerstag,nein).

% einzeleintrag(TagesID,von,bis,Text)


einzeleintrag(5,10,12,se3-vorlesung).
einzeleintrag(1,20,24,geburtstagsfeier).


% zyklischer_eintrag(Wochentag,Erstmaliges_Datum,Letztmaliges_Datum,Text,Ausnahme)

