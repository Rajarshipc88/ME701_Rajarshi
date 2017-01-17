function binary_to_decimal(i,f)
S=0
for j=1:sizeof(i)
S+=mod(i,10)*(2^(j-1))
i=div(i,10)
end
T=0
for j=1:sizeof(f)
T+=

return S
end
D=binary_to_decimal(101,10)
print(D)
