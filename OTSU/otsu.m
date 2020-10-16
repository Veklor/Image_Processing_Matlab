function [sonuc]=otsu(resim)
%resim=imread('yusaku.jpg'); % resmi oku
resim_gri=rgb2gray(resim); %resmi gri skalaya ge�ir

[H,W]=size(resim_gri); %resim boyutu

resim_gri=im2double(resim_gri); % i�lem uygulamak i�in 0-1 aral���na �ek


resim_max=max(max(resim_gri)); % resmin minimumu 
resim_min=min(min(resim_gri)); %resmin maksimumu

%esik_degeri=rand()*(resim_max-resim_min)+resim_min;

esik_degeri=(resim_max+resim_min)/2; %resmin ba�lang�� i�in e�ik de�eri

t0=esik_degeri; % e�ik de�er ilk durum
t1=0; %son durum 

while abs(t1-t0)>0.001 % e�er de�i�me 0.001 den y�ksekse devam
    
t0=esik_degeri;

esik_ustu_ort=0;
esik_alti_ort=0;


esik_ustu_sayilar=0;
esik_alti_sayilar=0;


for i=1:H
    for j=1:W
        
        if resim_gri(i,j)> esik_degeri % e�ik de�erin �st�nde kalanlar
            
            esik_ustu_sayilar=esik_ustu_sayilar+1; % say�s�
            esik_ustu_ort=esik_ustu_ort+resim_gri(i,j); %toplamlar�

        end
        if resim_gri(i,j) <= esik_degeri % e�ik de�erin alt�nda kalanlar
            
            esik_alti_sayilar=esik_alti_sayilar+1;            
            esik_alti_ort=esik_alti_ort+resim_gri(i,j);

      
        end
    end
end

%esik_degeri=esik_degeri*256;
esik_ustu_ort=(esik_ustu_ort/esik_ustu_sayilar); % e�ik de�erin alt� ve �st� i�in ortalamalar
esik_alti_ort=(esik_alti_ort/esik_alti_sayilar);

esik_degeri=(esik_ustu_ort+esik_alti_ort)/2; % yeni e�ik de�eri

t1=esik_degeri; % yeni e�ik de�erini t1 durumuna atarak k�yaslama yap

end
sonuc=t1;
disp(sonuc);
end