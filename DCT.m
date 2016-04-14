clear; clc;
pkg load signal;
pkg load image;
fullPath = ('C:\Users\Edu\Desktop\Nova pasta\Imagem para teste\couple.tiff');
A = imread(fullPath);

figure, imshow(A)


[x,y] = size(A); 

B = uint8(zeros(x,y));   C=B;


for i = 1:8
  for j = 1:8
    Q(i,j) = 1+(1+i+j)*2;
  end
end

for i = 1:64,
  for j = 1:64,
    B = A(8*i-7:8*i,8*j-7:8*j);
    B = dct2(B);
    B = B./Q;
    B = round(B);
    B = B.*Q;
    B = idct2(B);
    B = round(B);
    C(8*i-7:8*i,8*j-7:8*j)= B;
   end
end



figure,imshow(C)

imwrite(C,'C:\Users\Edu\Desktop\Nova pasta\Imagem para teste\couple-compress.JPEG');
