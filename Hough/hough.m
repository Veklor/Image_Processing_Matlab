function []=hough(resim)
%resim= imread('yol.jpg');

Resim_yeni=resim; % sonuc resmi icin

resim=rgb2gray(resim); 


E=edge(resim,'canny'); % resmi edge detectiona sok.


figure,title('Candy Edge Sonucu'),imshow(E);


[Height,Width]= size(E); % boyutlar� al

distMax=round(sqrt(Height^2+Width^2)); % maximum uzakl�k yani hipoten�s

aci=90; % her resim asl�nda dikd�rtgen veya kare oldu�u i�in -90 ile +90 aras�nda de�erler al�r.

theta= -aci:1:aci-1; % aci araliklari 

rho= -distMax:1:distMax; % uzakl�k araliklari



H=zeros(length(rho),length(theta)); % resmin �izgi grafi�i i�in 



for ix=1:Width
   for iy=1:Height
       
      if E(iy,ix)~=0  % 0 olan pixellere gerek yok 
          
        for iTheta=1:length(theta) % 180 dereceyi de kontrol et
            
            t= theta(iTheta)*pi/180; % aci de�eri ��kar
            
            dist= ix*cos(t)+iy*sin(t); % rhoyu bul
            
            [d, iRho]= min(abs(rho-dist)); %mutlak en k�sa mesafeyi bul. En k�sa zaten dik inmedir. 
            

            
            if d<=1 
               
                H(iRho,iTheta)=H(iRho,iTheta)+1; % ilgili noktaya oy ver
               
                
            end
          
        end
      end
    end 
end

maximum=max(max(H)); % max oyu alan 
toplam=0; 
kac_deger=0;

for i=1:length(rho)

    for j=1:length(theta)
        
        if H(i,j)>0 % e�er oy varsa
            
            toplam=toplam+H(i,j); % topla
             kac_deger=kac_deger+1;  % oy alan ka� nokta var
        end
        
    end

    
    
end

ort=toplam/kac_deger; % ortalamas�n� al
toplam=maximum-(2*ort); % bu ortalaman�n 2 kat�n� maxdan ��kararak ilgili aral��� yakalamaya �al��t�m.
                        % 2 kat� yapmam�n sebebi ise standart sapma mant���yla d���nd���m i�in.

for ix=1:Width
   for iy=1:Height
       
      if E(iy,ix)~=0  
          
        for iTheta=1:length(theta)
            
            t= theta(iTheta)*pi/180;
            
            dist= ix*cos(t)+iy*sin(t);
            
            [d, iRho]= min(abs(rho-dist));
            

            
             if H(iRho,iTheta)>toplam % de�erler toplam olarak belirlenen oy s�n�r�ndan fazla oy ald�ysa k�rm�z� yap. 
                    
                    Resim_yeni(iy,ix,1)=255;
                    Resim_yeni(iy,ix,2)=0;
                    Resim_yeni(iy,ix,3)=0;
                    
                    
            end
        end
      end
    end 
end




figure, title('Resmin ��lenmi� Hali'),imshow(Resim_yeni);




imtool(H,[]);


end
