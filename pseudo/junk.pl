rerouteArrow(ArrowID,OldPortID,NewPortID):-
    arrow(ArrowID,nil),
    receiver(ArrowID,OldPortID,_),
    format("orphanReceiver(~w).~n", [OldPortID]),
    format("receiver(~w,~w).~n", [ArrowID,NewPortID]).
