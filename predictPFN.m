function Y=predictPFN(Xz,G,L,Z,M,W)
% function for forecasting future prices

H=G-M-L+1;     % previous samples
N=length(W)/M; % the neurons number of the hidden layer (i.e., hidneurons)
YY=Xz(1:G);YY(G+1:G+Z)=0;
for i=1:Z
Q=Qmatrix(YY,M,i,H,N);
YY(G+1:G+i)=Q*W;
end
Y=YY(G+1:G+Z);