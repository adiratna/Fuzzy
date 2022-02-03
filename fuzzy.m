% Suatu aturan fuzzy dinyatakan sebagai berikut :
% IF x adalah A AND y adalah B THEN z adalah C
% dengan :
% A = 0,1/1 + 0,3/2 + 0,7/3 + 1,0/4 + 0,6/5 + 0,2/6 + 0,1/7
% B = 0,2/1 + 0,8/2 + 0,1/3 + 0,6/4 + 0,4/5 + 0,3/6 + 0,1/7
% C = 0,3/1 + 0,5/2 + 0,6/3 + 1,0/4 + 0,7/5 + 0,2/6 + 0,1/7
% Untuk masukan fuzzy :
% x = 0,1/2 + 0,5/3 + 1,0/4 + 0,1/5
% y = 0,2/3 + 0,6/4 + 1,0/5 + 0,4/6 + 0,1/7
% Hitunglah spark ignition w dan himpunan fuzzy keluaran C'

% Solusi
% Program Inferensi Fuzzy
clear;
clc;
A = [0.1 0.3 0.7 1.0 0.6 0.2 0.1];  % Himpunan fuzzy A
B = [0.2 0.8 1.0 0.6 0.4 0.3 0.1];  % Himpunan fuzzy B
C = [0.3 0.5 0.6 1.0 0.7 0.2 0.1];  % Himpunan fuzzy C
x = [0.0 0.1 0.5 1.0 0.1 0.0 0.0];  % Masukan fuzzy x
y = [0.0 0.0 0.2 0.6 1.0 0.4 0.1];  % Masukan fuzzy y

% Hitung spark ignition w1
w1 = max([min(x(1),A(1)) min(x(2),A(2)) min(x(3),A(3)) min(x(4),A(4)) min(x(5),A(5)) min(x(6),A(6)) min(x(7),A(7))])

% Hitung spark ignition w2
w2 = max([min(y(1),B(1)) min(y(2),B(2)) min(y(3),B(3)) min(y(4),B(4)) min(y(5),B(5)) min(y(6),B(6)) min(y(7),B(7))])

% Hitung spark ignition w
w = min(w1,w2)

% Hitung himpunan fuzzy keluaran C'
CP = [min(w,C(1)) min(w,C(2)) min(w,C(3)) min(w,C(4)) min(w,C(5)) min(w,C(6)) min(w,C(7))]
