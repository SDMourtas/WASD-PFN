function [Y,E]=testPFN(Xz,G,L,T,M,W)
% function for testing the optimal hidden-layer neurons weights of the PFN

[m,n]=size(W);
N=m/M;       % the neurons number of the hidden layer (i.e., hidneurons)
H=G-M-T-L+1; % training samples
Q=Qmatrix(Xz,M,T,H,N);
Y=Q*W;
YY=Xz(G-T+1:G);
E=100/T*sum(abs(Y-YY)./((abs(Y)+abs(YY))./2)); % SMAPE
if n~=1
E=mean(E);
end