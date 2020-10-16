function []=hough(resim)
%resim= imread('yol.jpg');

Resim_yeni=resim; % sonuc resmi icin

resim=rgb2gray(resim); 


E=edge(resim,'canny'); % resmi edge detectiona sok.


figure,title('Candy Edge Sonucu'),imshow(E);


[Height,Width]= size(E); % boyutlarý al

distMax=round(sqrt(Height^2+Width^2)); % maximum uzaklýk yani hipotenüs

aci=90; % her resim aslýnda dikdörtgen veya kare olduðu için -90 ile +90 arasýnda deðerler alýr.

theta= -aci:1:aci-1; % aci araliklari 

rho= -distMax:1:distMax; % uzaklýk araliklari



H=zeros(length(rho),length(theta)); % resmin çizgi grafiði için 



for ix=1:Width
   for iy=1:Height
       
      if E(iy,ix)~=0  % 0 olan pixellere gerek yok 
          
        for iTheta=1:length(theta) % 180 dereceyi de kontrol et
            
            t= theta(iTheta)*pi/180; % aci deðeri çýkar
            
            dist= ix*cos(t)+iy*sin(t); % rhoyu bul
            
            [d, iRho]= min(abs(rho-dist)); %mutlak en kýsa mesafeyi bul. En kýsa zaten dik inmedir. 
            

            
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
        
        if H(i,j)>0 % eðer oy varsa
            
            toplam=toplam+H(i,j); % topla
             kac_deger=kac_deger+1;  % oy alan kaç nokta var
        end
        
    end

    
    
end

ort=toplam/kac_deger; % ortalamasýný al
toplam=maximum-(2*ort); % bu ortalamanýn 2 katýný maxdan çýkararak ilgili aralýðý yakalamaya çalýþtým.
                        % 2 katý yapmamýn sebebi ise standart sapma mantýðýyla düþündüðüm için.

for ix=1:Width
   for iy=1:Height
       
      if E(iy,ix)~=0  
          
        for iTheta=1:length(theta)
            
            t= theta(iTheta)*pi/180;
            
            dist= ix*cos(t)+iy*sin(t);
            
            [d, iRho]= min(abs(rho-dist));
            

            
             if H(iRho,iTheta)>toplam % deðerler toplam olarak belirlenen oy sýnýrýndan fazla oy aldýysa kýrmýzý yap. 
                    
                    Resim_yeni(iy,ix,1)=255;
                    Resim_yeni(iy,ix,2)=0;
                    Resim_yeni(iy,ix,3)=0;
                    
                    
            end
        end
      end
    end 
end




figure, title('Resmin Ýþlenmiþ Hali'),imshow(Resim_yeni);




imtool(H,[]);


end
