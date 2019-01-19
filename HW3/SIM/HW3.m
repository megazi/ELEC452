clc
clear
close all

load('HW3_1.txt');
HW3_1 = HW3_1';

data_size = 101;
down_sample = 10;

Vin = zeros(6,data_size);
Iout = zeros(6,data_size);

for i=1:1:6
   holder = 1;
   for j = (data_size*(i-1)+1):((i*data_size))
       Vin(i,holder) = HW3_1(1,j);
       Iout(i,holder) = HW3_1(2,j);
       holder = holder + 1;
   end
   holder = 1;
end

Iout_downsampled = NaN(6,data_size);

for i=1:1:6
    for j=1:down_sample:data_size
        Iout_downsampled(i,j) = Iout(i,j);
    end
end

figure();
p1 = plot(Vin(1,:),Iout(1,:)*10^3,"k"); hold on;
p2 = plot(Vin(1,:),Iout_downsampled(1,:)*10^3 , "+k"); hold on;
    
p3 = plot(Vin(2,:),Iout(2,:)*10^3,"k"); hold on;
p4 = plot(Vin(2,:),Iout_downsampled(2,:)*10^3 , "ok"); hold on;

p5 = plot(Vin(3,:),Iout(3,:)*10^3,"k"); hold on;
p6 = plot(Vin(3,:),Iout_downsampled(3,:)*10^3 , "*k"); hold on;

p7 = plot(Vin(4,:),Iout(4,:)*10^3,"k"); hold on;
p8 = plot(Vin(4,:),Iout_downsampled(4,:)*10^3 , "xk"); hold on;

p9 = plot(Vin(5,:),Iout(5,:)*10^3,"k"); hold on;
p10 = plot(Vin(5,:),Iout_downsampled(5,:)*10^3 , "sk"); hold on;

p11 = plot(Vin(6,:),Iout(6,:)*10^3,"k"); hold on;
p12 = plot(Vin(6,:),Iout_downsampled(6,:)*10^3 , "dk"); hold on;

title("Giris Gerilimi / Cikis Akimi");
xlabel("Giris Gerilimi (V)"); ylabel("Cikis Akimi (mA)");
legend([p2 p4 p6 p8 p10],{"10u","110u","210u","310u","410u","500u"});

load("HW3_2.txt");
HW3_2 = HW3_2';
Vout2 = zeros(4,data_size);

for i=1:1:4
   holder = 1;
   for j = (data_size*(i-1)+1):((i*data_size))
       Vout2(i,holder) = HW3_2(3,j);
       holder = holder + 1;
   end
   holder = 1;
end

Vout2_downsampled = NaN(4,data_size);

for i=1:1:4
    for j=1:down_sample:data_size
        Vout2_downsampled(i,j) = Vout2(i,j);
    end
end

figure();
p9 = plot(Vin(1,:),Vout2(1,:)*10^3,"k"); hold on;
p10 = plot(Vin(1,:),Vout2_downsampled(1,:)*10^3 , "+k"); hold on;
    
p15 = plot(Vin(4,:),Vout2(4,:)*10^3,"k"); hold on;
p16 = plot(Vin(4,:),Vout2_downsampled(4,:)*10^3 , "xk"); hold on;

title('Giris Gerilimi / Cikis Gerilimi Grafigi');
xlabel('Giris Gerilimi (V)'); ylabel('Cikis Gerilimi (V)');
legend([p10 p16],{"10u","500u"});

load('HW3_3.txt');
HW3_3 = HW3_3';
data_size3 = 1000;
freq = zeros(4,data_size3);
gain = zeros(4,data_size3);

for i=1:1:4
   holder = 1;
   for j = (data_size3*(i-1)+1):((i*data_size3))
       freq(i,holder) = HW3_3(1,j);
       gain(i,holder) = HW3_3(2,j);
       holder = holder + 1;
   end
   holder = 1;
end

gain_downsampled = NaN(4,1000);
for i=1:1:4
    for j=1:50:data_size
        gain_downsampled(i,j) = gain(i,j);
    end
end

figure();
p17 = semilogx( freq(1,:), gain(1,:) , "-k"); hold on;
p18 = semilogx( freq(1,:), gain_downsampled(1,:) , "*k"); hold on;

p19 = semilogx( freq(2,:), gain(2,:) , "-k"); hold on;
p20 = semilogx( freq(2,:), gain_downsampled(2,:) , "ok"); hold on;

p21 = semilogx( freq(2,:), gain(3,:) , "-k"); hold on;
p22 = semilogx( freq(2,:), gain_downsampled(3,:) , "sk"); hold on;

p23 = semilogx( freq(2,:), gain(4,:) , "-k"); hold on;
p24 = semilogx( freq(2,:), gain_downsampled(4,:) , "dk"); hold on;

title("Kazanc / Frekans Grafigi");
xlabel("Frekans (Hz)");
ylabel("Kazanc (dB)");
legend([p18 p20 p22 p24],{"50u" , "200u" , "400u" ,"500u"});
grid on;


load('HW3_4.txt');
HW3_4 = HW3_4';
data_size4 = 1000;

freq2 = zeros(4,data_size4);
angle = zeros(4,data_size4);

for i=1:1:4
   holder = 1;
   for j = (data_size4*(i-1)+1):((i*data_size4))
       freq2(i,holder) = HW3_4(1,j);
       angle(i,holder) = HW3_4(2,j);
       holder = holder + 1;
   end
   holder = 1;
end

angle = db2mag(angle);

angle_downsampled = NaN(4,1000);
for i=1:1:4
    for j=1:50:data_size
        angle_downsampled(i,j) = angle(i,j);
    end
end

figure();
p25 = semilogx( freq2(1,:), angle(1,:) , "-k"); hold on;
p26 = semilogx( freq2(1,:), angle_downsampled(1,:) , "*k"); hold on;

p27 = semilogx( freq2(2,:), angle(2,:) , "-k"); hold on;
p28 = semilogx( freq2(2,:), angle_downsampled(2,:) , "ok"); hold on;

p29 = semilogx( freq2(3,:), angle(3,:) , "-k"); hold on;
p30 = semilogx( freq2(3,:), angle_downsampled(3,:) , "dk"); hold on;

p31 = semilogx( freq2(4,:), angle(4,:) , "-k"); hold on;
p32 = semilogx( freq2(4,:), angle_downsampled(4,:) , "sk"); hold on;

title("Egim / Frekans Grafigi");
xlabel("Frekans (Hz)");
ylabel("Egim (mA)");
legend([p26 p28 p30 p32],{"50u" , "200u" , "400u" ,"500u"});
grid on;
