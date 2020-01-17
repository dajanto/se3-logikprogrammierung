:- dynamic mutter_von/2, vater_von/2.        % ermoeglicht dynamische Veraenderung
% :- multifile mutter_von/2, vater_von/2.      % ermoeglicht verteilte Definition in mehreren Files

% mutter_von( Mutter , Kind ).
% 'Mutter' und 'Kind' sind Argumentpositionen,
% so dass 'Mutter' die Mutter von 'Kind' ist.

%mutter_von( marie , hans ).
%mutter_von( marie , helga ).
%mutter_von( julia , otto ).
%mutter_von( barbara , klaus ).
%mutter_von( barbara , andrea ).
%mutter_von( charlotte , barbara ).
%mutter_von( charlotte , magdalena ).


% vater_von( Vater , Kind ).
% 'Vater' und 'Kind' sind Argumentpositionen,
% so dass 'Vater' die Vater von 'Kind' ist.

%vater_von( otto , hans ).
%vater_von( otto , helga ).
%vater_von( gerd , otto ).
%vater_von( johannes , klaus ).
%vater_von( johannes , andrea).
%vater_von( walter , barbara ).
%vater_von( walter , magdalena ).

%mutter_von(birgit,inga).
%mutter_von(hildegard,birgit).
%mutter_von(ursula,hildegard).
%mutter_von(birgit,arne).
%mutter_von(inga,emma).
%vater_von(gernot,birgit).

vater_von(heinz,heinrich).
vater_von(heinrich,flo).
vater_von(flo,emma).
vater_von(flo,anton).

% Alleinstehende Mutter
mutter_von(hacke,peterle).

mutter_von(hilde,madre).
mutter_von(hilde,julklapp).
mutter_von(madre,inga).
mutter_von(inga,emma).
mutter_von(inga,anton).

% Alle Vorfahren berechnen 
% TODO 

vorfahrenVon(Vorfahre,Nachkommende) :- 

vater_von(_,Nachkommende),
vater_von(Vorfahre,_).
%mutter_von(_,Nachkommende),
%mutter_von(Vorfahre,_).

%(vater_von(_,Nachkommende),
%vater_von(Vorfahre,_)) |
%(mutter_von(_,Nachkommende),
%mutter_von(Vorfahre,_)).

% Jüngsten gemeinsamen Vorfahren zweier Personen berechnen
% TODO

juengsterGemeinsamerVorfahre(Person1,Person2,JüngsterVorfahre) :- 

mutter_von(JüngsterVorfahre,Person1),
mutter_von(JüngsterVorfahre,Person2).



% Zwei sind verwandt, wenn sie einen gemeinsamen Vorfahren haben

% verwandMit(Person,Verwandter) :- 



% Doppelergebnisse, warum und wie fixbar?












