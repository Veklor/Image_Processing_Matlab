function [sonuc]=otsu(resim)
%resim=imread('yusaku.jpg'); % resmi oku
resim_gri=rgb2gray(resim); %resmi gri skalaya geçir

[H,W]=size(resim_gri); %resim boyutu

resim_gri=im2double(resim_gri); % iþlem uygulamak için 0-1 aralýðýna çek


resim_max=max(max(resim_gri)); % resmin minimumu 
resim_min=min(min(resim_gri)); %resmin maksimumu

%esik_degeri=rand()*(resim_max-resim_min)+resim_min;

esik_degeri=(resim_max+resim_min)/2; %resmin baþlangýç için eþik deðeri

t0=esik_degeri; % eþik deðer ilk durum
t1=0; %son durum 

while abs(t1-t0)>0.001 % eðer deðiþme 0.001 den yüksekse devam
    
t0=esik_degeri;

esik_ustu_ort=0;
esik_alti_ort=0;


esik_ustu_sayilar=0;
esik_alti_sayilar=0;


for i=1:H
    for j=1:W
        
        if resim_gri(i,j)> esik_degeri % eþik deðerin üstünde kalanlar
            
            esik_ustu_sayilar=esik_ustu_sayilar+1; % sayýsý
            esik_ustu_ort=esik_ustu_ort+resim_gri(i,j); %toplamlarý

        end
        if resim_gri(i,j) <= esik_degeri % eþik deðerin altýnda kalanlar
            
            esik_alti_sayilar=esik_alti_sayilar+1;            
            esik_alti_ort=esik_alti_ort+resim_gri(i,j);

      
        end
    end
end

%esik_degeri=esik_degeri*256;
esik_ustu_ort=(esik_ustu_ort/esik_ustu_sayilar); % eþik deðerin altý ve üstü için ortalamalar
esik_alti_ort=(esik_alti_ort/esik_alti_sayilar);

esik_degeri=(esik_ustu_ort+esik_alti_ort)/2; % yeni eþik deðeri

t1=esik_degeri; % yeni eþik deðerini t1 durumuna atarak kýyaslama yap

end
sonuc=t1;
disp(sonuc);
end