
%Written by Playmaker

% goruntu okuma
galaxy=imread('eiffel.jpg');
%gri scalaya çevirme
galaxy_to_gray=rgb2gray(galaxy);

% goruntunun pixellerini denkleme uygun þekle sokmak için double çevirdim
galaxy_with_int=galaxy_to_gray;


% control edilecek kýsým
Max=7;      %  QUANTÝZATÝON KATSAYISI
carpan=2;   %  SAMPLÝNG KATSAYISI


% goruntunun en  boy oraný
[height,width]=size(galaxy_with_int);

% aralýklar olusturma

araliklar=linspace(0,256,Max);

% pixelleri aralýklara gore ayarlama

for x=1:height
    for y=1:width
        
        min_fark=255;
        secilen_kisim=0;
        
        for z=1:Max
            
            if min_fark > abs(galaxy_with_int(x,y)-araliklar(1,z))
                
                min_fark=abs(galaxy_with_int(x,y)-araliklar(1,z));
                secilen_kisim=araliklar(1,z);
            
            end
            
        end
        
        galaxy_with_int(x,y)=secilen_kisim;
        
    end
end



galaxy_with_int=im2double(galaxy_with_int);




%dongu kac kere donecek
dongu_X=(width/carpan);
dongu_Y=(height/carpan);



%sýradaki pixellerin yerleri
degisken_X=1;
degisken_Y=1;







% asýl dongu
    for i=1:dongu_Y-1
    
        degisken_Y=1+(carpan*(i-1));
           
        for j=1:dongu_X-1
        
        
            % deðiþken deðerlerini olusturma
            toplam= 0;
            degisken_X=1+(carpan*(j-1));
            
        
            % pixel deðerlerini al ve topla
            for k=1:carpan
            
                for l=1:carpan
                
                
                    toplam = toplam + galaxy_with_int(degisken_Y+l,degisken_X+k);
                
                
            
                end
                
            end
            
            
            % toplamýn ortalamasýný al
            toplam=toplam/(carpan*carpan);
        
      
        
            % pixellere ortalayý ver 
            for k=0:carpan
            
                for l=0:carpan
                
                
                    galaxy_with_int(degisken_Y+l,degisken_X+k)=toplam;
                
          
                end
                
            end
            
        
        
        
    
        end
        
    end
    
    
 
% kaydet

imwrite(galaxy_with_int,'eiffel_2_with_8x8_pixel_128_color_scale.jpg');       

% ekrana goster
figure,imshow(galaxy_with_int);


