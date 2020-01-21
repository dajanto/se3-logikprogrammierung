% Vorgefertigt in den Folien
int2peano(0,0).

int2peano(Int,s(P)) :-

Int > 0,
N1 is Int - 1,
int2peano(N1,P).


% TODO
%peano2int(s(P),Int,Liste) :-
peano2int(s(P),Liste) :-



