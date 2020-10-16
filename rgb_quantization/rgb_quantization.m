
% resmi oku
im1=imread('manzara.jpg');

% boyutlar�n� al
[H,W,D]=size(im1);

% quantization i�in araliklar
araliklar=linspace(1,255,5);

 %her pixeli dolas
for i=1:H

    for j=1:W
        
            %   degiskenler
        
            min_R=255;
            min_G=255;
            min_B=255;
            
            secilen_aralik_R=0;
            secilen_aralik_G=0;
            secilen_aralik_B=0;
            
            for k=1:5
                      % RED D�MENS�ON
                 if abs(im1(i,j,1)-araliklar(k))< min_R
                     
                     min_R=abs(im1(i,j,1)-araliklar(k));
                     secilen_aralik_R=araliklar(k);
                    
                 end
                    %   GREEN D�MENS�ON
                 if abs(im1(i,j,2)-araliklar(k))< min_G
                     
                     min_G=abs(im1(i,j,2)-araliklar(k));
                     secilen_aralik_G=araliklar(k);
                    
                 end
                    %   BLUE D�MENS�ON
                 if abs(im1(i,j,3)-araliklar(k))< min_B
                     
                     min_B=abs(im1(i,j,3)-araliklar(k));
                     secilen_aralik_B=araliklar(k);
                    
                 end
            end
             % secilen araliklara esitle
            im1(i,j,1)=secilen_aralik_R;
            im1(i,j,2)=secilen_aralik_G;
            im1(i,j,3)=secilen_aralik_B;
            
            
    end

end

%   resmi yaz



imwrite(im1,'manzara_with_quantization_of_5.jpg');

%   resmi goruntule
figure, imshow(histogram);

%   Her renk tonunu ay�r
Kirmizi = im1(:,:,1);
Yesil = im1(:,:,2);
Mavi = im1(:,:,3);

%   Her renk scalas�n�n histogram haritas�
[yKirmizi, x] = imhist(Kirmizi);
[yYesil, x] = imhist(Yesil);
[yMavi, x] = imhist(Mavi);

%   Tek plotta 3 renk tonunu da 5 �entikli olarak g�r�nt�le
plot(x, yKirmizi, 'Red', x, yYesil, 'Green', x, yMavi, 'Blue');