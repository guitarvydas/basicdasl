arrow(id1, a5).
arrowBegin(a5, v_x_e).
arrowEnd(a5, [v_d]).
circle(id3, v_d).
color(id3, yellow).
comp(id1, v).
comp(id2, v_x).
contains(id0, id1).
contains(id1, id2).
contains(id1, id3).
contains(id1, id4).
rect(id2, v_x_e).
shape(id1, "component").
shape(id2, "component").
shape(id2, "rect").
shape(id3, "circle").
shape(id4, "arrow").
aBegin(a5,id2).
aEnd(a5,[id3]).
connectionType(id3,explicit).
direction(id3,input).
location(id3,external).
port(id3,nil).
