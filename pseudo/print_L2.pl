component_L2(ID):-
    component(ID),
    \+ orphan(ID,nil).

synonym_L2(ID,Syn):-
    synonym(ID,Syn).

port_L2(P):-
    port(P).

link_L2(ID):-
    link(ID).

composite_L2(ID):-
    composite(ID).

arrows_L2(ID,["-","-"]) :- link(ID).
arrows_L2(ID,Bag):-
    composite(ID),
    arrow(AID,nil),
    contains(ID,AID),
    setof([S,R], 
	  ( nonorphan_sender_synonym(AID,S),
	    nonorphan_receiver_synonym(AID,R) ),
	  Bag).

sendersynonym_L2(A,S):-sendersynonym(A,S).
receiversynonym_L2(A,S):-receiversynonym(A,S).
externalPort_L2(ID):-externalPort(ID).

nonorphan_sender_synonym(ArrowID,Synonym) :-
    sendersynonym_L2(ArrowID,Synonym),
    externalPort_L2(PortID),
    synonym_L2(PortID,Synonym),
    contains(ComponentID,PortID),
    \+ orphan(ComponentID,nil).

nonorphan_receiver_synonym(ArrowID,Synonym) :-
    receiversynonym_L2(ArrowID,Synonym),
    externalPort_L2(PortID),
    synonym_L2(PortID,Synonym),
    contains(ComponentID,PortID),
    \+ orphan(ComponentID,nil).


printComponentIDs_L2:-
    setof(ID,component_L2(ID),Bag),format("component IDs ~w~n", [Bag]).

printComponents_L2:- 
    setof([ID,Syn],(component_L2(ID),synonym_L2(ID,Syn)),Bag),maplist(second,Bag,Items),format("components    ~w~n", [Items]).

printPorts_L2:-
    setof([P,Syn],(port_L2(P),synonym_L2(P,Syn)),Bag),maplist(second,Bag,Items),format("ports ~w~n", [Items]).

printLinks_L2:-
    setof([ID,Syn],(link_L2(ID),synonym_L2(ID,Syn)),Bag),maplist(second,Bag,Items),format("links ~w~n", [Items]).

printArrows_L2:-
    setof([ID,L],(composite_L2(ID),arrows_L2(ID,L)),Bag)*->(format("arrows ~w~n", [Bag])) ; format("(no arrows)~n",[]).
    %% setof([ID,L],(composite_L2(ID),arrows_L2(ID,L)),Bag)*->(maplist(second,Bag,Items),format("arrows ~w~n", [Items])) ; format("(no arrows)~n",[]).
