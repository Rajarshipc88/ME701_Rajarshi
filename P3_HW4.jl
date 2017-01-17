s=readall("atomic_masses.txt")
r1=r"Atomic Number = [0-9]+"
r2=r"[0-9]+"
Z=matchall(r1,s)
Z=string(Z)
Z1=matchall(r2,Z)

r3=r"Atomic Symbol = [a-z|A-Z]+"
r4=r"[a-z|A-Z]+"
X=matchall(r3,s)
X=string(X)
X1=matchall(r4,X)



r5=r"Mass Number = [0-9]+"
r6=r"[0-9]+"
A=matchall(r5,s)
A=string(A)
A1=matchall(r6,A)



r7=r"Relative Atomic Mass = [0-9]+[.][0-9]+"
r8=r"[0-9]+[.][0-9]+"
M=matchall(r7,s)
M=string(M)
M1=matchall(r8,M)
print(M1)
p1=length(M1)
print(p1)

Z=Z1[2:3179]
A=A1[2:3179]
X=X1
M=M1

print(A)
