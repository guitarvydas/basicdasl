:- dynamic rect/2.
:- dynamic ellipse/2.
:- dynamic circle/2.
:- dynamic arrow/2.
:- dynamic text/2.
:- dynamic str/2.
:- dynamic contains/2.
:- dynamic synonym/2.
:- dynamic sendersynonym/2.
:- dynamic receiversynonym/2.

:- dynamic color/2.
:- dynamic rounded/2.
:- dynamic strokeWidth/2.

:- dynamic orphan/2.
:- dynamic orphanSender/1.
:- dynamic orphanReceiver/1.

% layer high
%     port is a rect or circle
maybePort(ID) :-
    rect(ID,nil),
    \+ rounded(ID,nil).
maybePort(ID) :-
    circle(ID, nil).
port(ID) :-
    maybePort(ID),
    containsExactlyOneText(ID).
port(ID) :-
    maybePort(ID),
    containsNothing(ID).


externalPort(ID):-
    port(ID),
    circle(ID,nil).

internalPort(ID):-
    port(ID),
    rect(ID,nil).

inputPort(ID):-
    port(ID),
    color(ID,green).

outputPort(ID):-
    port(ID),
    color(ID,yellow).
outputPort(ID):-
    port(ID),
    color(ID,red).


explicitPort(ID):-
    port(ID),
    \+ implicitPort(ID).

implicitPort(ID):-
    port(ID),
    text(ID,TextID),
    str(TextID,S),
    firstChar(S,"*").
    
component(ID):-
    rect(ID,nil),
    rounded(ID,nil),
    notOrphaned(ID).
component(ID):-
    ellipse(ID,nil),
    notOrphaned(ID).
composite(ID) :-
    component(ID),
    contains(ID,Other),
    nonTextObject(Other),
    \+ port(Other).
link(ID):-
    component(ID),
    \+ port(ID),
    \+ localTemp(ID),
    \+ composite(ID).

% layer mid
localTemp(ID):-
    ellipse(ID,nil).

object(ID):-
    rect(ID,nil).
object(ID):-
    ellipse(ID,nil).
object(ID):-
    text(ID,nil).
nonTextObject(ID):-
    object(ID),
    \+ text(ID,nil).

containsNothing(ID):-
    \+ contains(ID,_).

containsExactlyOneText(ID):-
    contains(ID,TextID),
    text(TextID,nil),
    \+ contains2Items(ID).

contains2Items(ID):-
    contains(ID,Item1),
    contains(ID,Item2),
    Item1 \= Item2.

% layer low
firstChar(S,C):-
    sub_string(S,0,1,2,C).

second([_,B],B).

notOrphaned(ID):-
    \+ orphan(ID,nil).

sender(ArrowID,SenderID,SenderSynonym):-
    arrow(ArrowID,_),
    sendersynonym(ArrowID,SenderSynonym),
    synonym(SenderID,SenderSynonym).
receiver(ArrowID,ReceiverID,ReceiverSynonym):-
    arrow(ArrowID,_),
    receiversynonym(ArrowID,ReceiverSynonym),
    synonym(ReceiverID,ReceiverSynonym).
