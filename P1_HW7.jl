using PyCall
using PyPlot
@pyimport numpy as np

function Q(rho_e, rho_h) 
    
    return (rho_e + rho_e^2*(exp(-1.0/rho_e)-1.0) +rho_h + rho_h^2*(exp(-1.0/rho_h)-1.0))
end

function sig_Q(rho_e, rho_h) 

a = rho_e^2 + 2.*rho_e^3*(exp(-1.0/rho_e)-1) + 0.5*rho_e^3*(1-exp(-2.0/rho_e))
b = rho_h^2 + 2.*rho_h^3*(exp(-1.0/rho_h)-1) + 0.5*rho_h^3*(1-exp(-2.0/rho_h))
c = 2.*rho_e*rho_h + 2.*rho_e^2*rho_h*(exp(-1.0/rho_e)-1) +2.*rho_h^2*rho_e*(exp(-1.0/rho_h)-1)
d = 2.*(rho_e*rho_h)^2/(rho_e-rho_h)*(exp(-1.0/rho_e)-exp(-1.0/rho_h))
#print a, b, c, d, a+b+c+d, Q(rho_e,rho_h)^2, rho_e, rho_h"
return sqrt( a+b+c+d-Q(rho_e,rho_h)^2)
end

function R(rho_e, rho_h) 
    return 100*sig_Q(rho_e, rho_h)/Q(rho_e, rho_h)
end

n = 100
H =logspace(-2,2, n)
E =logspace(-2,2, n)
H,E=np.meshgrid(H,E,sparse=false,indexing="ij")
res = R.(E, H)

figure(1)
xlabel("Electron Extraction Factor")
ylabel("Hole Extraction Factor")

ax=PyPlot.gca()

ax[:set_xlim]([0.1 ,100])
ax[:set_ylim]([0.1,100])
ax[:set_xscale]("log")
ax[:set_yscale]("log")
l=[0.1,1,10,100]
ax[:set_xticks](l)
ax[:set_yticks](l)



cs=ax[:contour](E,H, res, 11, colors="k")
text(100,0.11,"40%",fontsize="10")
text(100,0.16,"30%",fontsize="10")
text(100,0.22,"20%",fontsize="10")
text(100,0.3,"15%",fontsize="10")
text(100,0.4,"10%",fontsize="10")
text(100,0.54,"5%",fontsize="10")
text(100,1.2,"2%",fontsize="10")
text(100,2.6,"1%",fontsize="10")
text(0.11,100,"40%",fontsize="10")
text(0.16,100,"30%",fontsize="10")
text(0.22,100,"20%",fontsize="10")
text(0.3,100,"15%",fontsize="10")

    
           
