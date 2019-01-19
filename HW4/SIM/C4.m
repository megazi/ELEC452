clc
clear
close all

data2 = dlmread('C4_D1.txt','',1,0);

freq = data2(:,1);
dB = data2(:,2);

figure();
semilogx(freq,dB,"-k");
grid on;
title("Frequency Response");
xlabel("Frequency (Hz)");
ylabel("Gain (dB)");
axis([0 5*10e9 -120 -32]);