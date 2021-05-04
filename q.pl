conn(Component,[Sender|SendingPort],[ReceivingComponent|ReceivingPort]) :-
    connection(Component,ConnectionID),
    sender(ConnectionID,SenderPairID),
    pp(SenderPairID,SendingPort),
    pc(SenderPairID,Sender),
    receiver(ConnectionID,ReceiverPairID),
    pc(ReceiverPairID,ReceivingComponent),
    pp(ReceiverPairID,ReceivingPort).

allReceivers(Component,S,R) :-
    setof(Receivers,conn(Component,S,Receivers),R).

conn(Component,'-->'(S,RBag)):-
    allReceivers(Component, S, RBag).

conn(':'(C,W)) :-
    conn(C,W).
