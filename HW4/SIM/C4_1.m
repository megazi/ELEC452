clc
clear
close all

load("C4_D2.txt");

d1 = C4_D2(:,1);
d2 = C4_D2(:,2);
d3 = C4_D2(:,3);

figure();
%plot(d1,d2,"-k"); hold on;

max = max(d3);
min = min(d3);
offset = (abs(min) + abs(max)) / 2;
d3 = d3* + offset;
d3 = d3*2.0000e+146;
plot(d1,d3,"--k");
legend("Input","Output");
xlabel("time"); ylabel("Amp.");