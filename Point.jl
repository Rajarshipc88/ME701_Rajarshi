immutable Point
x::Float64
y::Float64
end
import Base: +,-,*
+(p1::Point,p2::Point)=Point(p1.x+p2.x,p1.y+p2.y)
*(p1::Point,c::Float64)=Point(p1.x*c,p1.y*c)
p1=Point(1.0,2.0)
p2=Point(2.0,3.0)
p3=p1+p2

print(p3)

c=2.0
p4=p1*c
print(p4)
