I = imread('ev.jpg');


hesaplanan=otsu(I);
disp(hesaplanan);
disp('**************************');

[counts,x] = imhist(I,256);
T = otsuthresh(counts);
disp(T);
disp('**************************');

dogruluk_orani=(T/hesaplanan)*100;
disp(dogruluk_orani);
