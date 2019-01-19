clc
clear
close all

load('data3_1.txt');
data3_1 = data3_1';

d3_Vd = data3_1(2,:);
d3_Iout = data3_1(4,:);
Iref3 = data3_1(1,:);

load('data3_compare.txt');
data3_compare = data3_compare';

d2_Vd = data3_compare(2,:);
d2_Iout = data3_compare(4,:);
Iref2 = data3_compare(1,:);

%%
d3_Vdmin = min(d3_Vd);
d2_Vdmin = min(d2_Vd);

d3vdmin_index = find(d3_Vd == d3_Vdmin);
d2vdmin_index = find(d2_Vd == d2_Vdmin);

%%

d3_Iout = d3_Iout(1:7:d3vdmin_index);
d2_Iout = d2_Iout(1:7:d2vdmin_index);


coef = d3vdmin_index / d2vdmin_index;

plot(Iref3(1:7:d3vdmin_index),d3_Iout , '-*k'); hold on;
plot(Iref2(1:7:d2vdmin_index)*coef,d2_Iout*coef , '-ok');
title("Basit Akim Aynasi / Gelismis Wilson Akim Kaynagi");
xlabel("Referans Akimi (Olceklenmis)");
ylabel("Cikis Akimi (Olceklenmis)");
lcd = legend("G. Wilson Akim Aynasi","Basit Akim Aynasi");
lcd.Location = 'northwest';

