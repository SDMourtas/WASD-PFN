function [G,L,T,Z,z]=problem(x)
% Input data and parameters of the WASD based PFN setup

if x==1
data=xlsread('data1');z=data(1:84,1); % Example 1, monthly data of MNI140

% PFN model options
G=68;   % total number of observations for training
L=16;   % the number of intervals ahead of time instant t (Integers)
T=16;   % number of testing data
Z=16;   % number of forecasting data

elseif x==2
    
data=xlsread('data1');z=data(1:129,2); % Example 2, monthly data of MRG17
G=111;  L=18;  T=18; Z=18;             % PFN model options

else
    
data=xlsread('data2');z=data(:,x-2); % Example 3-32, daily data
G=180;  L=40;  T=40; Z=50;           % PFN model options
end