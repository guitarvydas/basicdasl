:- include(r).

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
	  ( nonorphan_sender(AID,_,S),
	    nonorphan_receiver(AID,_,R) ),
	  Bag).

sender_L2(A,ID,S):-sender(A,ID,S).
receiver_L2(A,ID,S):-receiver(A,ID,S).
externalPort_L2(ID):-externalPort(ID).

nonorphan_sender(ArrowID,SenderID,Synonym) :-
    sender_L2(ArrowID,SenderID,Synonym),
    externalPort_L2(PortID),
    contains(ComponentID,PortID),
    \+ orphan(ComponentID,nil).

nonorphan_receiver(ArrowID,ReceiverID,Synonym) :-
    receiver_L2(ArrowID,ReceiverID,Synonym),
    externalPort_L2(PortID),
    contains(ComponentID,PortID),
    \+ orphan(ComponentID,nil).

listOrphanArrow(ArrowID,PortID) :-
    arrow(ArrowID,nil),
    sender(ArrowID,PortID),
    format("orphan_arrow(~w, nil)~n", [ArrowID]).
listOrphanArrow(ArrowID,PortID) :-
    arrow(ArrowID,nil),
    receiver(ArrowID,PortID),
    format("orphan_arrow(~w, nil)~n", [ArrowID]).
listOrphanArrows(PortID):-
    bagof(ArrowID,listOrphanArrow(ArrowID,PortID),_).
