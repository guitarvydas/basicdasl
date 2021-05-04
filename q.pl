conn(Component,[Sender|SendingPort],[ReceivingComponent|ReceivingPort]) :-
    connection(Component,ConnectionID),
    sender(ConnectionID,SenderPairID),
    pp(SenderPairID,SendingPort),
    pc(SenderPairID,Sender),
    receiver(ConnectionID,ReceiverPairID),
    pc(ReceiverPairID,ReceivingComponent),
    pp(ReceiverPairID,ReceivingPort).

conn([Component,S,R]) :-
    conn(Component,S,R).

allConn(Set) :-
    setof(X,conn(X),Set).

    
