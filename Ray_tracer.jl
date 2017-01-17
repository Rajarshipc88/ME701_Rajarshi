using PyPlot
@pyimport matplotlib.pyplot as plt
@pyimport numpy as np



abstract Object

immutable Point <:Object
x::Float64
y::Float64
end
import Base: +,-,*
+(p1::Point,p2::Point)=Point(p1.x+p2.x,p1.y+p2.y)
*(p1::Point,c::Float64)=Point(p1.x*c,p1.y*c)
dot(p1::Point, p2::Point) = (p1.x*p2.x + p1.y*p2.y)
norm(p1::Point)=sqrt(p1.x*p1.x+p1.y*p1.y)
unitize(p1::Point) = (p1.x/norm(p1)+ p1.y/norm(p1))

type Ray <: Object
    orig::Point
    dir::Point
end


abstract Node <: Object
contains::Function
" Does the node contain the point?"
intersections::Function
" Where does the node intersect the ray?"
end

type Surface <: Node
f::Function  "Function that implicitly defines the surface"
end




type Primitive <: Node
surface:: Surface
sense::Bool
function contains(p)
return (surface.f(p::Point)<0)==sense
end
function intersections(r::Ray)
return surface.intersections(r::Ray)
end
end





type Operator <: Node
L::Array
R::Array
contains(p::Point)::Function
function intersection(r::Ray)
pointsL=L.intersections(r::Ray)
pointsR=R.intersections(r::Ray)

"Returns the concatenated results"
return pointsL+pointsR
end
end

type union <: Operator
function contains(p::Point)

type Region <: Object
node::None
function append(node::None,surface::None,operation="U" sense::false)
@assert=(node && !(surface)) || (surface && !(node))

if typeof(surface)==typeof(Surface)
node=Primitive(surface,sense)

else if node==None
node=node
else
if operation=="U"
O=union
else
O=Intersection
node=O(node::None,node)
end
end

intersections(r::Ray)::Function
end

type Geometry <: Object

noregion=-1

xmin::Float64
xmax::Float64
ymin::Float64
ymax::Float64
regions::Array

function add_region(r::Ray)
regions.append(r::Ray)
end
find_region(p::Point):: Function
function plot(xmin::Float64, xmax::Float64,nx::Int64, ymin::Float64, ymax::Float64,ny::Int64)
data=np.zeros((nx,ny))
x=np.linspace(xmin,xmax,nx+1)
x=x[1:]-x[1]/2.0
y=np.linspace(ymin,ymax,ny+1)
y=y[1:]-y[1]/2.0

for i in range(nx)
for j in range(ny)
p=Point(x[i],y[j])
data[i,j]=find_region(p::Point)
end
end


data=np.flipr(data).transpose()
plt.imshow(data,cmap='gray')

plt.axis('equal')
plt.show()















