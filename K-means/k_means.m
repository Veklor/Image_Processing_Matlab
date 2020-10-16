function [kontrol]=k_means(resim)

%resim=imread('beyin_mr.jpg');

resim_yeni=resim;

resim_gri=rgb2gray(resim);

[H,W]=size(resim_gri);



kume_sayisi=8;
kumelerin_eleman_sayisi=[0 0 0 0 0 0 0 0];

rgb_degerleri=zeros(kume_sayisi,3);

centroidler=zeros(kume_sayisi);
kontrol=0;


 % rastgele e�ik(merkez) de�erleri bul ve rgb tonlar� belirle
for i=1:kume_sayisi
    kumelerin_esik_degerleri(i)=rand()*255;
    rgb_degerleri(i,1)=rand()*255;
    rgb_degerleri(i,2)=rand()*255;
    rgb_degerleri(i,3)=rand()*255;
    
end

% k�meleri belirle
 kumeler=zeros(kume_sayisi,H,W);



while centroidler~=kumelerin_esik_degerleri % de�i�im var m�

    kontrol=kontrol+1; % ka� iterasyon var kontrol

    % k�meleri temizle ve merkezleri centroid dizisine at

    for i=1:kume_sayisi
        kumeler(i,:,:)=zeros(H,W);
        kumelerin_eleman_sayisi(i)=0;
        centroidler(i)=kumelerin_esik_degerleri(i);
    end

    % pixel de�erlerini en yak�n kumelere da��t

    for i=1:H
        for j=1:W
        
            min=255;
            hangisi=1;
        
            for k=1:kume_sayisi
            
             % mutlak uzunlu�a g�re hangisine yak�nsa ona gitsin
            
                if abs(resim_gri(i,j)-kumelerin_esik_degerleri(k))< min
                
                    hangisi=k;
                    min=abs(resim_gri(i,j)-kumelerin_esik_degerleri(k));
                
                end
            
            end
        
            kumeler(hangisi,i,j)=resim_gri(i,j);
            kumelerin_eleman_sayisi(hangisi)=(kumelerin_eleman_sayisi(hangisi)+1);
        
        
        
        end 
    end

     % yeni esik degerlerini hesapla
     for i=1:kume_sayisi
   
        kumelerin_esik_degerleri(i)=(sum(sum(kumeler(i,:,:)))/kumelerin_eleman_sayisi(i));
    
    end

end



for x=1:H
    for y=1:W
        for i=1:kume_sayisi
   
            if kumeler(i,x,y)~=0
                resim_yeni(x,y,1)=rgb_degerleri(i,1);
                resim_yeni(x,y,2)=rgb_degerleri(i,2);
                resim_yeni(x,y,3)=rgb_degerleri(i,3);
            end
        end
    end
end


imtool(resim_yeni,[]);



end
