using PyCall
@pyimport matplotlib.animation as animation
@pyimport matplotlib.pyplot as plt
@pyimport numpy as np

Alpha=0.0
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
        temp[2:-1] += dt * alpha / dx ^ 2 * (temp[1:-2] - 2 * temp[2:-1] + temp[3:-1])
    end
    y=linspace(0, L, Nx)
    return temp,y
     end

function animate()
    global Alpha
    Alpha=Alpha+0.01
    t,x=getTemp()
    line[:set_data](t, x)
    return (line,"")
     end
T,x=getTemp()
fig = plt.figure()
axis = fig[:add_subplot](111)
line, = axis[:plot](x, T)


ani=animation.FuncAnimation(fig,animate,init_func=getTemp, interval=100,blit=true,repeat=false)
plt.show()
