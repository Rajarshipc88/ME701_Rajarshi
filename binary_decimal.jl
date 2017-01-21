function binary_to_decimal(i,f)
S=0
for j=1:sizeof(i)
S+=mod(i,10)*(2^(j-1))
i=div(i,10)
end
T=0
n=f
f=string(f)
l=length(f)
k=l
for j=1:l
T+=div(n,10^(k-1))*(1/2^j)
if div(n,10^(k-1))!=0
n=n-10^(k-1)
end
k=k-1
end

return S,T
end

