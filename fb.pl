





component("main",nil).
component("subcomponent",nil).
connection("main",n0).
connection("main",n3).
contained("subcomponent","main").
inputPort("main","in").
inputPort("subcomponent","A").
outputPort("main","out").
outputPort("subcomponent","B").
pc(pair1,".").
pc(pair2,"subcomponent").
pc(pair4,"subcomponent").
pc(pair5,".").
pp(pair1,"in").
pp(pair2,"A").
pp(pair4,"B").
pp(pair5,"out").
receiver(n0,pair2).
receiver(n3,pair5).
sender(n0,pair1).
sender(n3,pair4).
