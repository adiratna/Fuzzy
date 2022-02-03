% Solusi
% Program dengan Matlab berikut menghitung defuzzifikasi centroid dari MF
% trapezoid, kemudian membandingkan dengan fungsi defuzz dari Matlab.
% Penghitungan defuzzifikasi dilakukan dengan mengambil bentuk diskrit dari
% Z_coa 

% Program Defuzzifikasi
clear;
clc;
z = -10:0.1:10;                 % Diskritisasi Z dengan interval 0.1
mf = trapmf(z,[-10 -8 -4 7]);   % MF trapezoid
smf = 0;
for i=1:201
    smf=smf+mf(i);              % Jumlah elemen MP
end;
zz = z*mf'/smf                  % Defuzzifikasi centroid
zzz = defuzz(z,mf,'centroid')   % Defuzzifikasi dengan Matlab