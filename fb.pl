







component("component_X",nil).
component("main",nil).
component("subcomponent",nil).
connection("main",n0).
connection("main",n4).
connection("main",n7).
connection("subcomponent",n10).
connection("subcomponent",n13).
contains("main","subcomponent").
contains("subcomponent","component_X").
inputPort("component_X","c").
inputPort("main","in").
inputPort("subcomponent","A").
outputPort("component_X","o_").
outputPort("main","out").
outputPort("subcomponent","so_").
pc(pair1,".").
pc(pair11,".").
pc(pair12,".").
pc(pair14,"component_X").
pc(pair15,".").
pc(pair2,"1").
pc(pair3,"2").
pc(pair5,"1").
pc(pair6,".").
pc(pair8,"2").
pc(pair9,".").
pp(pair1,"in").
pp(pair11,"A").
pp(pair12,"c").
pp(pair14,"o_").
pp(pair15,"so_").
pp(pair2,"A").
pp(pair3,"A").
pp(pair5,"so_").
pp(pair6,"out").
pp(pair8,"so_").
pp(pair9,"out").
receiver(n0,pair2).
receiver(n0,pair3).
receiver(n10,pair12).
receiver(n13,pair15).
receiver(n4,pair6).
receiver(n7,pair9).
sender(n0,pair1).
sender(n10,pair11).
sender(n13,pair14).
sender(n4,pair5).
sender(n7,pair8).
