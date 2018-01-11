clear all;
clc;
close all;
filename='efficiency1.xlsx';

%% Read all Values

x_wavelets= xlsread(filename,'B50:B84');
z_euclid_DB1= xlsread(filename,'C50:C84');
z_cityblk_DB1= xlsread(filename,'E50:E84');
z_cos_DB1= xlsread(filename,'G50:G84');
z_cor_DB1=xlsread(filename,'I50:I84');
%% KNN Euclidean

figure(1);

stem(x_wavelets,z_euclid_DB1,'red','c^-','linewidth',8);
hold on;
grid on;
stem(x_wavelets,z_cityblk_DB1,'green','ro:','linewidth',6);
hold on;
grid on;
stem(x_wavelets,z_cos_DB1,'blue','b+-.','linewidth',4);
hold on;
grid on;
stem(x_wavelets,z_cor_DB1,'yellow','c^--','linewidth',2);
hold on;
grid on;
xlabel('Type of Wavelets');
ylabel('%Efficiency');
title('DEBAUCHIES Wavelet with KNN Classifiers');