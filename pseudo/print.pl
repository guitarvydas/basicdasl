printComponentIDs:-
    setof(ID,component(ID),Bag),format("component IDs ~w~n", [Bag]).

printComponents:- 
    setof([ID,Syn],(component(ID),synonym(ID,Syn)),Bag),maplist(second,Bag,Items),format("components    ~w~n", [Items]).

printPorts:-
    setof([P,Syn],(port(P),synonym(P,Syn)),Bag),maplist(second,Bag,Items),format("ports ~w~n", [Items]).

printLinks:-
    setof([ID,Syn],(link(ID),synonym(ID,Syn)),Bag),maplist(second,Bag,Items),format("links ~w~n", [Items]).

printArrows:-
    setof([ID,L],(composite(ID),arrows(ID,L)),Bag)*->(maplist(second,Bag,Items),format("arrows ~w~n", [Items])) ; format("(no arrows)~n",[]).
