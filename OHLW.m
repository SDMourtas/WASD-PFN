function [W,Em,N,EE]=OHLW(Xz,G,l,M,kmax)
% function for finding the optimal hidden-layer neurons weights of the PFN

N=1; % the neurons number of the hidden layer (i.e., hidneurons)
d=N; Em=inf; EE=[]; n=length(l);

if n==1
L=l;
H=G-M-L+1; % training samples
Y=Xz(M+L:G);
else
L=l(end);
H=G-M-L+1; % training samples
Y=zeros(G-M-L+1,L);
for i=1:L
    Y(:,i)=Xz(M+i:G-L+i); 
end
end

while N>d-kmax
% WDD Method
Q=Qmatrix(Xz,M,H,0,d);
W=pinv(Q)*Y; 
E=100/H*sum(abs(Q*W-Y)./((abs(Q*W)+abs(Y))./2)); % SMAPE
if n~=1
E=mean(E);
end
if E<Em
    Em=E;N=d;
end
EE=[EE;E];
d=d+1;
end

% output
Q=Qmatrix(Xz,M,H,0,N);
W=pinv(Q)*Y; 
