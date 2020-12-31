%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  WASD-based PFN source codes for time-series modeling and         %
%  forecasting problems. (version 1.0 )                             %
%                                                                   %
%  Developed in MATLAB R2018b                                       %
%                                                                   %
%  Author and programmer: T.E. Simos, S.D.Mourtas, V.N.Katsikis     %
%                                                                   %
%   e-Mail: tsimos.conf@gmail.com                                   %
%           spirosmourtas@gmail.com                                 %
%           vaskatsikis@econ.uoa.gr                                 %
%                                                                   %
%   Main paper: T.E. Simos, S.D.Mourtas, V.N.Katsikis,              %
%               "Time-Varying Black-Litterman Portfolio Optimization%
%               under Nonlinear Constraints via Neuronets and BAS   %
%               Algorithm," (submitted)                             %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
close all
clc

% Choose forecasting problem (for x = 1 to 32)
x=1;
[G,L,T,Z,z]=problem(x);
kmax=10; % number of training iterations

% Data Preprocessing
n=G+Z;
[zD,D]=detrendd(z(1:n)); % detrend
[Xz,zC_min,zC_max]=Normalization(zD,n); % Normalization

% PFN model
tic
[M,Emint,EEE]=WASD(Xz,G,T,L,kmax); % optimal structure of the PFN
toc
[W,Em,N,EE]=OHLW(Xz,G-T,L,M,kmax); % optimal hidden-layer structure
Test_zn=testPFN(Xz,G,L,T,M,W);     % test for the next L data
Pr_zn=predictPFN(Xz,G,L,Z,M,W);    % forecasting for the next Z data

% Data Postprocessing
Test=Postprocessing(Test_zn,zC_min,zC_max,G,T,D,0); % denormalization and trend
Forec=Postprocessing(Pr_zn,zC_min,zC_max,G,Z,D,1);

% figures
figure
plot(0:n-1,z(1:n))
hold on
plot(G-T:G-1,Test)
plot(G:n-1,Forec)
legend('Actual price','Testing price','Forecasting price')
hold off

figure
plot(1:length(EEE),EEE)
hold on
plot(M,Emint,'r.','MarkerSize',16)
xlabel('M');ylabel('SMAPE')
legend('Mean Error','Minimum Point')
hold off

figure
semilogy(1:length(EE),EE)
hold on
semilogy(N,Em,'r.','MarkerSize',16)
xlabel('N');ylabel('SMAPE')
legend('Error of Optimal M','Minimum Point')
hold off