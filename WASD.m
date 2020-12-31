function [Mm,Emint,EEE]=WASD(Xz,G,T,L,kmax)
% function for finding the optimal input-layers number of the PFN

M=1; % the neurons number of the input layer (i.e., the number of lagged...
     % observations), M \in [1,G-L] (Integers)
Emint=inf; G2=round(G/2);
EEE=zeros(G2,1);
while M<=G2
    W=OHLW(Xz,G-T,1:L,M,kmax); % optimal hidden-layer structure
    [~,Etest]=testPFN(Xz,G,L,T,M,W);
    if Etest<Emint
        Emint=Etest;
        Mm=M;
    end
    EEE(M)=Etest;
    M=M+1;
end