using PyCall
@pyimport matplotlib.animation as animation
@pyimport numpy as np

Alpha=0.0
function animate()
    global Alpha
    t,x=getTemp()
     Alpha=Alpha+0.01
    line[:set_data](t, x)
    return (line,None)
     end
function getTemp()
    dt = 0.00005
    dx = 0.01
    L=1
    tMax=0.1
    Nx = (L / dx)
    Nx=trunc(Int,Nx)
    dx = L / Nx
    Nt = tMax / dt
    Nt=trunc(Int,Nt)
    dt = tMax / Nt

    dx = L / Nx
    dt = tMax / Nt

    temp = zeros(Nx)
    temp[1] = 1

    for i=1:Nt
        temp[2:-1] += dt * Alpha / dx ^ 2 * (temp[1:-2] - 2 * temp[2:-1] + temp[3:-1])
    end
    y=linspace(0, L, Nx)
    return temp,y
     end

T1,x=getTemp()
figure()
ax=PyPlot.gca()
#axis = figure[:add_subplot](111)
line, = ax[:plot](x, T1)


ani=animation.FuncAnimation(figure,animate,init_func=getTemp, interval=100,blit=false,repeat=false)
show()
