



component("main",nil).
connection(id0,"main").
inputPort("in","main").
outputPort("out","main").
pairComponent(id1,".").
pairComponent(id2,".").
pairPort(id1,"in").
pairPort(id2,"out").
receiver(id2,id0).
sender(id1,id0).
