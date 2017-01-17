S1=["pit","spot","spate","slap two" ,"respite"]
S2=["pt","Pot","peat","part"]

R=r"[p-s][^to|ea]" 
m1=ismatch(R,S2[2])
print(m1)
