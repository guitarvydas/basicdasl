



>outputPort("B","subcomponent").
>outputPort("out","main").
[]
[contained("subcomponent","main").
]
component("main",nil).
component("subcomponent",nil).
connection(id0,"main").
connection(id0,"subcomponent").
connection(id3,"main").
main<inputPort("in","main").
pairComponent(id1,".").
pairComponent(id1,".").
pairComponent(id2,".").
pairComponent(id2,"subcomponent").
pairComponent(id4,"subcomponent").
pairComponent(id5,".").
pairPort(id1,"A").
pairPort(id1,"in").
pairPort(id2,"A").
pairPort(id2,"B").
pairPort(id4,"B").
pairPort(id5,"out").
receiver(id2,id0).
receiver(id2,id0).
receiver(id5,id3).
sender(id1,id0).
sender(id1,id0).
sender(id4,id3).
subcomponent<inputPort("A","subcomponent").
