function [Xz,zC_min,zC_max]=Normalization(zC,n)
% function for normalization

zC_min=zC(1);zC_max=zC(1);
for i=2:n
    zC_min=min(zC_min,zC(i));
    zC_max=max(zC_max,zC(i));
end
zCn=@(t)(zC(t)-zC_min)/(4*zC_max-4*zC_min)-0.5;
Xz=zeros(n,1);
for i=1:n
    Xz(i)=zCn(i);
end