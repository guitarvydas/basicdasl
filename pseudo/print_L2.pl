:- include(r_L2).

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
