xpoints=[1,2,-1]
ypoints=[8,4,3,0]
zpoints=[0,-1]

points[i,j,k]=[(xpoints[i],ypoints[j],zpoints[k]) for i=1:sizeof(xpoints),j=1:sizeof(ypoints),k=1:sizeof(zpoints)]
print(points)
