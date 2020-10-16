
% Resmi oku

a = imread('eiffel.jpg');
a=rgb2gray(a);

% Resmin boyutunu al
[m,n] = size(a);

% "uint8" i double a �evir.
b = double(a);

% de2bi desimali binary sat�r vekt�r�ne �evirir. 
c = de2bi(b);

% "de2bi" bundan dolay� iki boyutlu diziyi tek boyutlu binary vekt�r�ne
% �evirecek

% LSB en sa�daki bite denir
%%%%%%%%%%%%%%

% Her pixelin en sa�daki bitini se�ip c1 e ata 
c1 = c(:,1);
% "reshape" ile tek boyutlu matrisleri resim boyutlar�na d�n��t�r ve resim
% olu�abilsin.
r1 = reshape(c1,m,n);
% 2.bit
c2 = c(:,2);
r2 = reshape(c2,m,n);
% 3.bit
c3 = c(:,3);
r3 = reshape(c3,m,n);
% 4.bit
c4 = c(:,4);
r4 = reshape(c4,m,n);
% 5.bit
c5 = c(:,5);
r5 = reshape(c5,m,n);
% 6.bit
c6 = c(:,6);
r6 = reshape(c6,m,n);
% 7.bit
c7 = c(:,7);
r7 = reshape(c7,m,n);
% 8.bit
c8 = c(:,8);
r8 = reshape(c8,m,n);


% B�t�n bit tiplerini goruntule
subplot(241);
imshow(r1);title('1.bit(LSB) katmani');
subplot(242);
imshow(r2);title('2.bit katmani');
subplot(243);
imshow(r3);title('3.bit katmani');
subplot(244);
imshow(r4);title('4.bit katmani');
subplot(245);
imshow(r5);title('5.bit katmani');
subplot(246);
imshow(r6);title('6.bit katmani');
subplot(247);
imshow(r7);title('7.bit katmani');
subplot(248);
imshow(r8);title('8.bit(MSB) katmani');
