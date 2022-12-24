clear all
close all
clc

%Ucitavanje podataka iz tabele u matricu
Podaci=xlsread('Potrošnja_električne_energije.xlsx', 'Sheet2', 'A2302:J2401');

%Ucitavanje podataka o aktivnoj, reaktivnoj snazi i naponu u matrice
Aktivna_Snaga=Podaci(:,4);
Reaktivna_Snaga=Podaci(:,5);
Napon=Podaci(:, 6);

%Grafici promjene napona, aktivne i reaktivne snage u vremenskom domenu

%Ucitavanje podataka o vremenu u matricu t
t=Podaci(:,3);
figure(1)
plot(t, Napon, "red");
title('Promjena napona u vremenskom domenu', 'Color', 'red');
xlabel('Vrijeme (t)');
ylabel('Napon (U)');

figure(2)
plot(t, Aktivna_Snaga, "green");
title('Promjena aktivne snage u vremenskom domenu', 'Color', 'green');
xlabel('Vrijeme (t)');
ylabel('Aktivna snaga (W)');

figure(3)
plot(t, Reaktivna_Snaga, "blue");
title('Promjena reaktivne snage u vremenskom domenu', 'Color', 'blue');
xlabel('Vrijeme (t)');
ylabel('Reaktivna snaga (W)');

%Kroskorelacija
cros=xcorr(Aktivna_Snaga, Reaktivna_Snaga);
figure(4)
disp(cros)
stem(cros)
title('Kroskorelacija')


