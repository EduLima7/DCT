clear; clc;
pkg load signal;
pkg load image;
fullPath = ('C:\Users\Edu\Desktop\Nova pasta\Imagem para teste\couple.tiff');
A = imread(fullPath);

figure, imshow(A)

#Armazena as dimensões da imagem lida em x e y 
[x,y] = size(A);

#Iniciando matrizes de zeros com dimensão igual a da imagem
B = uint8(zeros(x,y));   C=B;

#Dimensão dos blocos que são aplicados DCT
M = 8;    N = 8;

#Fator de Qualidade
F = 2; 

#Criando a matriz de quantização Q
for i = 1:M
  for j = 1:N
    Q(i,j) = 1+(1+i+j)*F;
  end
end

#Percorrendo a matriz com blocos MxN e aplicando a dct em cada bloco, logo em seguida é aplicada a inversa da dct
for i = 1:x/M,
  for j = 1:y/N,
    B = A(M*i-(M-1):M*i,N*j-(N-1):N*j);
    B = dct2(B);
    B = B./Q;
    B = round(B);
    B = B.*Q;
    B = idct2(B);
    B = round(B);
    C(M*i-(M-1):M*i,N*j-(N-1):N*j)= B;
   end
end



figure,imshow(C)

imwrite(C,'C:\Users\Edu\Desktop\Nova pasta\Imagem para teste\couple-compress.JPEG');
