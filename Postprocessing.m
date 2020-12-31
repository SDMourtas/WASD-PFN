function G=Postprocessing(A,zC_min,zC_max,G,L,D,R)
% function for denormalization and for adding the time-series trend 

if R==0
    J=G-L;
else
    J=G;
end
B=@(t)(A(t)+0.5)*(4*zC_max-4*zC_min)+zC_min;
C=@(t)(B(t)).*polyval(D,J+t)';
G=zeros(L,1);
for i=1:L
    G(i)=C(i);
end