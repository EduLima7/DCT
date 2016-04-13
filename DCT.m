clear; clc;
pkg load signal
fullPath = ('C:\Users\Edu\Desktop\Nova pasta\Imagem para teste\couple.tiff');
A = imread(fullPath);
figure, imshow(A)

B = zeros(512,512); C=B;

Q = [ 16, 11, 10, 16, 24, 40, 51, 61 ;
      12, 12, 14, 19, 26, 58, 60, 55 ;
      14, 13, 16, 24, 40, 57, 69, 56 ;
      14, 17, 22, 29, 51, 87, 80, 62 ;
      18, 22, 37, 56, 68, 109, 103, 77 ;
      24, 35, 55, 64, 81, 104, 113, 92 ;
      49, 64, 78, 87, 103, 121, 120, 101 ;
      72, 92, 95, 98, 112, 100, 103, 99];

for i = 1:64,
  for j = 1:64,
    C = A(8*i-7:8*i,8*j-7:8*j);
    C = C./Q;
    C = dct2(C);
    C = round(C);
    C = C.*Q;
    C = idct2(C);
    C = round(C);
    B(8*i-7:8*i,8*j-7:8*j)= C;
   end
end


figure,imshow(B)

imwrite(B,'C:\Users\Edu\Desktop\Nova pasta\Imagem para teste\couple2.tiff');
