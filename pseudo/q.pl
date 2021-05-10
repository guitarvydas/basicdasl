gobject(ID) :- rect(ID,_).
gobject(ID) :- circle(ID,_).
gobject(ID) :- comp(ID,_).
gobject(ID) :- cyl(ID,_).
gobject(ID) :- arrow(_,ID).

gkind(ID,"rect") :- rect(ID,_).
gkind(ID,"circle") :- circle(ID,_).
gkind(ID,"comp") :- comp(ID,_).
gkind(ID,"cyl") :- cyl(ID,_).
gkind(ID,"arrow") :- arrow(_,ID).

tag(ID,Tag) :- gkind(ID,"rect"),rect(ID,Tag).
tag(ID,Tag) :- gkind(ID,"circle"),circle(ID,Tag).
tag(ID,Tag) :- gkind(ID,"comp"),comp(ID,Tag).
tag(ID,Tag) :- gkind(ID,"cyl"),cyl(ID,Tag).

nonArrowGobject(ID,Synonym) :- rect(ID,Synonym).
nonArrowGobject(ID,Synonym) :- circle(ID,Synonym).
nonArrowGobject(ID,Synonym) :- comp(ID,Synonym).
nonArrowGobject(ID,Synonym) :- cyl(ID,Synonym).

synonym(ID,Synonym) :-
    nonArrowGobject(ID,Synonym).

printABegin(ID) :-
    arrowBegin(ID,Tag),
    synonym(AID,Tag),
    format("aBegin(~w,~w).~n",[ID,AID]).

printAllABegin :-
    forall(arrowBegin(ID,_),printABegin(ID)).

aReplaceReceiverSynonyms([],[]).
aReplaceReceiverSynonyms([Syn|Rest],[AID|Rlist]):-
    synonym(AID,Syn),
    aReplaceReceiverSynonyms(Rest,Rlist).

printOneAEnd(AID,Rlist) :-
    arrowEnd(AID,ReceiverSynonymList),
    aReplaceReceiverSynonyms(ReceiverSynonymList,Rlist),
    format("aEnd(~w,~w).~n",[AID,Rlist]).

printAllAEnd :-
    forall(arrowEnd(AID,_),printOneAEnd(AID,_)).
