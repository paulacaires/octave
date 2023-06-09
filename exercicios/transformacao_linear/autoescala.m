% Transformação linear, transformação de intensidade
close all, clear, clc
pkg load image

% C:\Users\mjpau\Downloads\files\imagens\cacau_escuro.tif

% ====  Transformação linear   ====   %
% RICE:       C:\Users\mjpau\Downloads\files\imagens\rice.png
% MAMOGRAFIA: C:\Users\mjpau\Downloads\files\imagens\mamografia.bmp
% BATATAS:    C:\Users\mjpau\Downloads\files\imagens\batatas.tif
% SOLDA:      C:\Users\mjpau\Downloads\files\imagens\solda.bmp
% LARANJAS:   C:\Users\mjpau\Downloads\files\imagens\laranjas.bmp

A = imread('C:\Users\mjpau\Downloads\files\imagens\laranjas.bmp');

figure, imshow(A);
figure, imhist(A);

fmax = max(A(:));
fmin = min(A(:));

[lin col] = size(A);

B = A;

for i=1:lin
  for j=1:col
    
    B(i,j) = 255 / (fmax - fmin) * (A(i,j) - fmin);
        
    if B(i,j) > 255
      B(i,j) = 255;
    else
      if B(i,j) < 0
        B(i,j) = 0;
      end
    end   
  end
end

figure, imhist(B);
figure, imshow(B);
