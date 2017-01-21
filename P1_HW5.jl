using PyPlot

s=readstring("atomic_masses.txt")
r1=r"Atomic Number = [0-9]+"
r2=r"[0-9]+"
Z=matchall(r1,s)
Z=string(Z)
Z1=matchall(r2,Z)

r3=r"Atomic Symbol = [a-z|A-Z]"
r4=r"[a-z|A-Z]"
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

Z1=Z1[2:3179]
A1=A1[2:3179]


Z=Z1  
A=A1  
M=M1 

Z=float(Z)
A=float(A)
M=float(M)

Mp=1.00782503207
Mn=1.0086649

BE_Meas=931.494*(Mn*A+(Mp-Mn)*Z-M)

"Calculation of Least-square error method;"

R1=A
R2=A.^(2/3)
Z1=Z.^2
A1=A.^(1/3)
R3=Z1./A1
Z2=A-2.*Z
Z2=Z2.^2
R4=Z2./A
p1=mod(Z,2)
p1=-1.^p1
p2=mod((A-Z),2)
p2=-1.^p2
p3=A.^-0.5
R5=p3.*(p1+p2)



"Append all the row matrices to form the co-efficient matrix:"

A_C=vcat([R1;R2;R3;R4;R5])


A_C=reshape(A_C,(3178,5))

At=A_C'
print(size(At))
b=BE_Meas
b=reshape(b,(3178,1))

Atb=*(At,b)
AtA=*(At,A_C)

x=Atb\AtA
x=x'
print(size(x))
"Calculating the Least-square error:"
E_LS=*(A_C,x)-b

"Calculate the Average error for least-square solution:"
S=0
for i=1:length(b)
S=S+E_LS[i]
end
E_avg=S/(length(b))

"Calculate the maximum value of error:"
E_max=maximum(abs(E_LS))

"Plot of the data"
b1=b./A "Binding energy per nucleon"
A1=reshape(A,(3178,1))
plot(A1,b1)
xlabel(" Atomic Mass")
ylabel(" Binding Energy per Nucleon")
title("Binding Energy per Nucleon vs Atomic Mass plot")






