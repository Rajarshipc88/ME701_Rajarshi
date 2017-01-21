function is_prime(n)
for i=2:n/2
if n%i==0
return false
end 
end
return true
end


