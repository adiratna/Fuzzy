% Program pemodelan fungsi z=cos(x)cos(y)
clc;
clear;
for i = 1:19            % Rentang masukan x [-180,180]
    x(i) = 20*i-200     % Dibagi menjadi 19 titik kisi
end
for j = 1:19            % Rentang masukan y [-180,180]
    y(j) = 20*j-200
end
p = 0;
for k = 1:19
    for l = 1:19
        z(l,k) = cos(x(1)/57.3248)*cos(y(k)/57.32481);
        p = p+1
        xp(p) = x(k);    % Susunlah data pelatihan x
        yp(p) = y(l);    % Susunlah data pelatihan y

        % Susunlah data pelatihan keluaran target
        zp(p) = cos(xp(p)/57.3248)*cos(yp(p)/57.32481);
    end
end
x1 = -180:20:180;
y1 = -180:20:180;
[X,Y] = meshgrid(x1,y1);
mesh(X,Y,z)             % Gambar fungsi z yang diinginkan
title('Fungsi z(x,y) Yang Diinginkan');
xlabel('x');
ylabel('y');
DataPelatihan = [xp' yp' zp']   % Data pelatihan

% Struktur ANFIS
cacahMFpremis = 5;              % Cacah parameter premis = 5
tipMFpremis = 'gbellmf'         % Tipe MF premis adalah bell gbellmf
tipMFkonsek = 'linear';         % Tipe MF konsekuensi adalah linear
cacahEpoch = 100;               % Cacah epoch adalah 100

% Bentuklah arsitektur ANFIS
ars = genfis1(DataPelatihan, cacahMFpremis,tipMFpremis, tipMFkonsek);
latih = anfis(DataPelatihan, ars, cacahEpoch) % Latih ANFIS
for r = 1:19
    for s = 1:19
        % Uji ANFIS dengan data pelatihan
        uji(s,r) = evalfis([x(s) y(r)], latih);
    end
end

x2 = -180:20:180;
y2 = -180:20:180;
[X,Y] = meshgrid(x2,y2);
figure;
mesh(X,Y,uji) % Gambarkan fungsi z hasil pemodelan
title ('Fungsi z(x,y) Hasil Pemodelan');
xlabel('x');
ylabel('y');

