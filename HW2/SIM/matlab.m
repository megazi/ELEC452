clc
clear
close all

%v3	V(n001)	V(n002)	I(R1)	I(R1)-I(R2)	I(R2)

load("data1.txt");
data1 = data1';

samplerate = 2;

Vin = data1(1,1:samplerate:end);
Id1 = data1(3,1:samplerate:end)*10^6;
Id2 = data1(4,1:samplerate:end)*10^6;
DI1I2 = data1(2,1:samplerate:end)*10^6;

%%
figure();
plot(Vin,Id1,"-ko"); hold on;
plot(Vin,Id2,"-k*");
axis([-0.3 0.3 -1 11]);
title("Graph of Vin / Idrain ");
xlabel("Vin1 (V)");
ylabel("Id1 and Id2 (uA)");
legend("Ir1","Ir2");
grid on;

%%
figure();
plot(Vin,DI1I2,"-ko");
axis([-0.3 0.3 -11 11]);
title("Graph of DI0 / DV0");
xlabel("DV0(V)");
ylabel("DI0(uA)");
legend("DI0");
grid on;

%%
load("data2.txt")
data2 = data2';
data_slide=305/5;
Vin2 = data2(1,1:samplerate:data_slide);

C11 = data2(2,1:samplerate:data_slide);
C12 = data2(3,1:samplerate:data_slide);

C21 = data2(2,1*data_slide+1:samplerate:2*data_slide);
C22 = data2(3,1*data_slide+1:samplerate:2*data_slide);

C31 = data2(2,2*data_slide+1:samplerate:3*data_slide);
C32 = data2(3,2*data_slide+1:samplerate:3*data_slide);

C41 = data2(2,3*data_slide+1:samplerate:4*data_slide);
C42 = data2(3,3*data_slide+1:samplerate:4*data_slide);

C11 = C11*(110/max(C11));
C12 = C12*(110/max(C12));

C21 = C21*(110/max(C21));
C22 = C22*(110/max(C22));

C31 = C31*(110/max(C31));
C32 = C32*(110/max(C32));

C41 = C41*(110/max(C41));
C42 = C42*(110/max(C42));

figure();
plot(Vin2,C11,"-ko"); hold on;
plot(Vin2,C12,"-ko"); hold on;
plot(Vin2,C21,"-k*"); hold on;
plot(Vin2,C22,"-k*"); hold on;
plot(Vin2,C31,"-ks"); hold on;
plot(Vin2,C32,"-ks"); hold on;
plot(Vin2,C41,"-kd"); hold on;
plot(Vin2,C42,"-kd"); hold on;
axis([-0.3 0.3 -5 115]);
xlabel("Vin1 (V)");
ylabel("Id1 and Id2 (uA)");
legend("10u","","20u","","30u","","40u","");
grid on;

%%

load ("data3.txt");
load ("data3-5.txt");
load ("data4.txt");
load ("data5.txt");

data3 = data3';
data3_5 = data3_5';
data4 = data4';
data5 = data5';

Vin3 = data3(1,1:2:end);

Gain11 = data3(2,1:2:end);
Gain12 = data3(3,1:2:end);

Gain21 = data3_5(2,1:2:end);
Gain22 = data3_5(3,1:2:end);

Gain31 = data4(2,1:2:end);
Gain32 = data4(3,1:2:end);

Gain41 = data5(2,1:2:end);
Gain42 = data5(3,1:2:end);

figure();
plot(Vin3,Gain11,"-ko"); hold on;
plot(Vin3,Gain12,"-ko"); hold on;
plot(Vin3,Gain21,"-k*"); hold on;
plot(Vin3,Gain22,"-k*"); hold on;
plot(Vin3,Gain31,"-kd"); hold on;
plot(Vin3,Gain32,"-kd"); hold on;
plot(Vin3,Gain41,"-ks"); hold on;
plot(Vin3,Gain42,"-ks"); hold on;
axis([-0.3 0.3 -5*10^-6 45*10^-6]);
legend("9.6u","#","19.2u","#","38.4u","#","76.8u","76.8u");
xlabel("Vin (V)");
ylabel("Id1 and Id2 (A)");
grid on;


