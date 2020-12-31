function [zD,D]=detrendd(z)
% function for removing the time-series trend

n=length(z);x=1:n;x=x';
D = polyfit(x,z,1);
zD=@(t)z(t)./polyval(D,t)';