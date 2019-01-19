clc
clear
close all

load('data3_1.txt');
data3_1 = data3_1';

d3_Iref = data3_1(1,:);
d3_Vd = data3_1(2,:);
d3_Iout = data3_1(4,:);

%%
figure();
plot(d3_Iref,d3_Iout,'-k');
title("Referans Akimi / Cikis Akimi Grafigi");
xlabel("Referans Akimi (A)");
ylabel("Cikis Akimi (A)");

d3_error = zeros(1,101);
d3_error = (d3_Iref - d3_Iout) ./ d3_Iref * 100;
figure();
plot(d3_Iref,abs(d3_error),'-k');
title("Referans Akimi / Cikis Akimi Grafigi Hata Grafigi");
xlabel("Referans Akimi (A)");
ylabel("Hata (%)");
axis([0 0.1 -10 100]);

%%

d3_Vdmin = min(d3_Vd);
figure();
x = [0 0.1];
y = [d3_Vdmin d3_Vdmin];
line(x,y,'Color','black','lineStyle','--'); hold on;
plot(d3_Iref,d3_Vd,'-k');

title("Referans Akimi / Vd Gerilimi Grafigi");
xlabel("Referans Akimi (A)");
ylabel("Vd Gerilimi (V)");
axis([0 0.1 5 15]);


