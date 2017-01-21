
function decimal_to_binary(x::Float64,n::Int64)
x_dec=x-floor(x)
x_dec=x_dec*10^(length(x_dec)) 
x1=floor(x)
b=[]
p=0
while(p!=1)
p=floor(x1/2)
f=trunc(Int,mod(x1,2))
push!(b,f)
x1=p
end
push!(b,1)
c=b[end:-1:1]

b1=[]
for i=1:n
d=x_dec*2
if d>1
f1=1
else
f1=0
end
f1=trunc(Int,f1)
push!(b1,f1)
x_dec=d-f1
end
return c,b1
end


