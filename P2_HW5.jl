using PyCall
using PyPlot
@pyimport matplotlib.pyplot as plt
@pyimport numpy as np

" We solve three integrals using Midpoint, Simpson's and Gauss-Legendre quadrature: "

"Define the three integrals: "

func1(x)
return x^5
end

func2(x)

return(1/(1+x^2))
end

func3(x)
return (x*sin(x))/(1+cos(x)^2))
end


"Define the Midpoint Method by a function call:"
"f=Return Value of the integration function. "
"b=Upper Bound of integral. "
"a=Lower bound of integral." 
"N=Total no of points in the interval"

function midpoint(f,a,b,N)  
    D=(b-a)/N  
    S=0.0
    x=linspace(a,b,N)
    for i=1:N
        S=S+f(x[i])*D 
    end
    return S
    end

"Define Simpson's 1/3rd rule of numerical integration by a function call:"

function Simpson (f,a,b,N):
"f=Return Value of  integration function. "
"b=Upper Bound of integral. "
"a=Lower bound of integral." 
"N=Total no of points in the interval."
    h=(b-a)/N
    k=0.0
    x=a + h
    for i in range(1,ceil(N/2))
        k += 4*f(x)
        x += 2*h
    end
    x = a + 2*h
    for i in range(1,floor(N/2)):
        k += 2*f(x)
        x += 2*h
   end
    return (h/3)*(f(a)+f(b)+k)
   end 

"Function definition for Gauss-Legendre Quadrature: " 
function Legendre_Gauss_Quadrature(f,a,b,N):
    S=0
    x,y=np.polynomial.legendre.leggauss(N)
    for i in range(1,N):
        x[i]=((b-a)/2)*x[i]+(b+a)/2
   end
    for i in range(1,N):
        S=S+f(x[i])*y[i]
    end
    return S
end

N=linspace(1,100,100)
 
"Calculation  for first Integral:"
"Exact algebraical solution of integral 1;"
I1_exact=0  
a=1
b=-1
I1_Midpoint=zeros(100)
I1_Simpson=zeros(100)
I1_Gauss_Legendre_Quad=zeros(100)
for i in range(1,len(N)):
    I1_Midpoint[i]=midpoint(func1,a,b,int(N[i]))
   end
    
for i in range(1,len(N)):
    I1_Simpson[i]=Simpson(func1,a,b,int(N[i]))
    end
    
for i in range(1,len(N)):
    I1_Gauss_Legendre_Quad[i]=Legendre_Gauss_Quadrature(func1,a,b,int(N[i]))
    end
    
"Calculation of Error terms for Integral 1:" 
e1_Midpoint=abs(I1_exact-I1_Midpoint)
e1_Simpson=abs(I1_exact-I1_Simpson)
e1_Quadrature=abs(I1_exact-I1_Gauss_Legendre_Quad)



"Calculation for 2nd Integral"
"#Exact algebraical solution of integral 1  (arc tan x) with upper bound=-5.And Lower bound=5"
I2_exact=-2.746801534 
a1=5
b1=-5
I2_Midpoint=zeros(100)
I2_Simpson=zeros(100)
I2_Gauss_Legendre_Quad=zeros(100)
for i in range(1,len(N)):
    I2_Midpoint[i]=midpoint(func2,a1,b1,int(N[i]))
    end
for i in range(1,len(N)):
    I2_Simpson[i]=Simpson(func2,a1,b1,int(N[i]))
    end
for i in range(1,len(N)):
    I2_Gauss_Legendre_Quad[i]=Legendre_Gauss_Quadrature(func2,a1,b1,int(N[i]))
    end
"Calculation of error term in integral 2:"
e2_Midpoint=abs(I2_exact-I2_Midpoint)
e2_Simpson=abs(I2_exact-I2_Simpson)
e2_Quadrature=abs(I2_exact-I2_Gauss_Legendre_Quad)


"Calculation for 3rd Integral:"
I3_exact=(np.pi**2)/4

a2=0
b2=np.pi
I3_Midpoint=zeros(100)
I3_Simpson=zeros(100)
I3_Gauss_Legendre_Quad=zeros(100)
for i in range(1,len(N)):
    I3_Midpoint[i]=midpoint(func3,a2,b2,int(N[i]))
    end
for i in range(1,len(N)):
    I3_Simpson[i]=Simpson(func3,a2,b2,int(N[i]))
    end
for i in range(1,len(N)):
    I3_Gauss_Legendre_Quad[i]=Legendre_Gauss_Quadrature(func3,a2,b2,int(N[i]))
    end
"Calculation of error term in integral 3:"
e3_Midpoint=abs(I3_exact-I3_Midpoint)
e3_Simpson=abs(I3_exact-I3_Simpson)
e3_Quadrature=abs(I3_exact-I3_Gauss_Legendre_Quad)


"Plotting of Errors:"

"Plot of error for first function:"
N1=log10.(N)
plt.legend(['Midpoint Error','Simpson Error' 'Gauss-Legendre Quadrature Error'])
plt.xlabel('Number of intervals:',fontsize=24)
plt.ylabel('Numerical Integration Errors',fontsize=24)
plt.title('Numerical Integration Error for Integral 1:')
plt.plot(N1,log10(e1_Midpoint),'k-',N1,log10(e1_Simpson),'g-',N1,log10(e1_Quadrature),'b-')


"Plot of errors for the second function"

N1=log10.(N)
plt.figure(2)
plt.legend(['Midpoint Error','Simpson Error' 'Gauss-Legendre Quadrature Error'])
plt.xlabel('Number of intervals:',fontsize=24)
plt.ylabel('Numerical Integration Errors',fontsize=24)
plt.title('Numerical Integration Error for Integral 2:')
plt.plot(N1,log10(e2_Midpoint),'k-',N1,log10(e2_Simpson),'g-',N1,log10(e2_Quadrature),'b-')


"Plot of errors for the third function:"

plt.figure(3)
plt.legend(['Midpoint Error','Simpson Error' 'Gauss-Legendre Quadrature Error'])
plt.xlabel('Number of intervals:',fontsize=24)
plt.ylabel('Numerical Integration Errors',fontsize=24)
plt.title('Numerical Integration Error for Integral 3:')
plt.plot(N1,np.log10(e3_Midpoint),'k-',N1,np.log10(e3_Simpson),'g-',N1,np.log10(e3_Quadrature),'b-')





    


