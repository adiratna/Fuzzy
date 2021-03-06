% Program Kendali Logika Fuzzy
clc;
clear;
a = newfis('Kendali Fuzzy');                            % Buat Sistem Inferensi Fuzzy

a = addvar(a,'input','Er',[-10 10]);                    % Tambah variabel Input1 (E)
a = addmf(a,'input',1,'N','trapmf',[-12 -10 -5 0]);     % Tambah MF1 pada Input1
a = addmf(a,'input',1,'Z','trimf',[-5 0 5]);            % Tambah MF2 pada Input1
a = addmf(a,'input',1,'P','trapmf',[0 5 10 12]);        % Tambah MF3 pada Input1

a = addvar(a,'input','CE',[-10 10]);                    % Tambah variabel Input2 (CE)
a = addmf(a,'input',2,'N','trapmf',[-12 -10 -5 0]);     % Tambah MF1 pada Input2
a = addmf(a,'input',2,'Z','trimf',[-5 0 5]);            % Tambah MF2 pada Input2
a = addmf(a,'input',2,'P','trapmf',[0 5 10 12]);        % Tambah MF3 pada Input2

a = addvar(a,'output','PI',[-10 10]);                   % Tambah varOutput (PI)
a = addmf(a,'output',1,'N','trapmf',[-12 -10 -5 0]);    % Tambah MF1 pada Output
a = addmf(a,'output',1,'Z','trimf',[-5 0 5]);           % Tambah MF2 pada Output
a = addmf(a,'output',1,'P','trapmf',[0 5 10 12]);       % Tambah MF3 pada Input2

Aturan =[               % Basis Aturan
    3 2 3 1 1           % If Er is P and CE is Z then PI is P
    2 1 1 1 1           % If Er is Z and CE is N then PI is N
    1 2 1 1 1           % If Er is N and CE is Z then PI is N
    2 3 3 1 1           % If Er is Z and CE is P then PI is P
    2 2 2 1 1           % If Er is Z and CE is Z then PI is Z
    3 1 3 1 1           % If Er is P and CE is N then PI is N
    1 1 1 1 1           % If Er is N and CE is N then PI is N
    1 3 1 1 1           % If Er is N and CE is P then PI is N
    3 3 3 1 1           % If Er is P and CE is P then PI is P
    3 1 2 1 1           % If Er is P and CE is N then PI is Z
    1 3 2 1 1];         % If er is N and CE is P then PI is Z

a = addRule(a,Aturan);          % Tambah aturan ke Sistem Inferensi Fuzzy
showrule(a)                     % Menunjukkan aturannya
KeluaranFLC=evalfis([0 0],a);   % Hitung keluaran FLC untuk E=0 dan CE=0
%plotfis(a)
gensurf(a)
