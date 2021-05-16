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

printAllABegin(Bag) :-
    bagof(ID,printABegin(ID),Bag).

aReplaceReceiverSynonyms([],[]).
aReplaceReceiverSynonyms([Syn|Rest],[AID|Rlist]):-
    synonym(AID,Syn),
    aReplaceReceiverSynonyms(Rest,Rlist).

printOneAEnd(AID) :-
    arrowEnd(AID,ReceiverSynonymList),
    aReplaceReceiverSynonyms(ReceiverSynonymList,Rlist),
    format("aEnd(~w,~w).~n",[AID,Rlist]).

printAllAEnd(Bag) :-
    bagof(AID,printOneAEnd(AID),Bag).

printAll :- printAllABegin, printAllAEnd.



parent(P,C) :-
    contains(PID,CID),
    synonym(PID,P),
    synonym(CID,C).

display(P):-
    setof(C,parent(P,C),Bag),
    format("~w: ~w~n", [P,Bag]).

displayAllPC:-
    setof(P,display(P),_).



externalPort(C) :-
    circle(C,_).
internalPort(R) :-
    rect(R,_),
    \+ comp(R,_).
port(P):-
    externalPort(P).
port(P):-
    internalPort(P).
inputPort(P) :-
    port(P).
outputPort(P):-
    port(P),
    \+ inputPort(P).
implicitPort(P):-
    port(P),
    strokeWidth(P,3).
explicitPort(P):-
    port(P),
    \+ implicitPort(P).
describePort(P):-
    port(P),
    format("port(~w,nil).~n", [P]),
    describeLocation(P),
    describeDirection(P),
    describeConnectionType(P).
describeLocation(P) :-
    externalPort(P),
    format("location(~w,external).~n", P).
describeLocation(P) :-
    internalPort(P),
    format("location(~w,internal).~n", P).
describeDirection(P) :-
    inputPort(P),
    format("direction(~w,input).~n", P).
describeDirection(P) :-
    outputPort(P),
    format("direction(~w,output).~n", P).
describeConnectionType(P) :-
    explicitPort(P),
    format("connectionType(~w,explicit).~n", P).
describeConnectionType(P) :-
    implicitPort(P),
    format("connectionType(~w,implicit).~n", P).
describeAllPorts:-
    setof(P,describePort(P),_).

