clc
clear all

A=[xlsread('Raspodjela podataka z2','Vrijednosti','C32:D32');xlsread('Raspodjela podataka z2','Vrijednosti','E32:F32');];
B=[xlsread('Raspodjela podataka z2','Vrijednosti','G32:G32');xlsread('Raspodjela podataka z2','Vrijednosti','H32:H32');];
C=[xlsread('Raspodjela podataka z2','Vrijednosti','I32:J32');];
D=[xlsread('Raspodjela podataka z2','Vrijednosti','K32');];

%Zaokruzivanje na trecu decimalu
A1=round(A,3)
B1=round(B,3)
C1=round(C,3)
D1=round(D,3)


H=ss(A,B,C,D);
%Konvertovanje state-space modela u prenosnu funkciju tf
[n,d]=ss2tf(A,B,C,D)
G=tf(n,d)

poles=eig(A)
CM=ctrb(A,B)

% Odzivi funkcije na step i impuls odziv
figure(1)
step(H)
figure(2)
impulse(H)

