using is_prime.jl
using is_even.jl

while true
println("Enter an integer:")
n=input()
if n<1 || n>1000000 || n<0
println("Wrong input.Enter Again") 
break
end

if is_even(n)==True and is_prime(n)==True
println("%n is even.\n" %(n))
println("%n is prime.\n",%(n))
else if is_even(n)==true and is_prime(n)==false
println("%n is even.\n",%(n))
println("%n is not prime.\n",%(n))
else if is_even(n)==false and is_prime(n)==true
println("%n is odd.\n",%(n))
println("%n is prime.\n",%(n))
else if is_even(n)==false and is_prime(n)==false
println("%n is odd.\n",%(n))
println("%n is not prime.\n",%(n))
end 

println("Enter True to continue and False to quit:")
I=input()
if I==False
break
end 
end




