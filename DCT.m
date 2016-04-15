close all; clear; clc;
pkg load signal;
pkg load image;
fullPath = ('C:\Users\Edu\Desktop\Nova pasta\Imagens para teste\Treino\4.2.07.tiff');
A = imread(fullPath);
figure, imshow(A)

#Armazena as dimensões da imagem em x,y,z. z será os canais, caso a imagem não seja em tons de cinza
[x,y,z] = size(A); 

#Usaremos a matriz B para manipular a imagem
B = uint8(zeros(x,y,z)); 

if(z>1)
  B = rgb2gray(A);
  figure, imshow(B)
end


#Dimensão dos blocos que serão aplicados DCT
M = 16;    N = 16;

#Fator de Qualidade
F = 2; 
#Criando a Matriz de Quantização
for i = 1:M
  for j = 1:N
    Q(i,j) = 1+(1+i+j)*F;
  end
end

#Percorrendo a matriz com blocos MxN e aplicando a dct em cada bloco, logo em seguida 
#é aplicada a inversa da dct
for i = 1:x/M,
  for j = 1:y/N,
    B = A(M*i-(M-1):M*i,N*j-(N-1):N*j);
    B = dct2(B);
    B = B./Q;
    B = round(B);
    B = B.*Q;
    B = idct2(B);
    B = round(B);
    A(M*i-(M-1):M*i,N*j-(N-1):N*j)= B;
   end
end


#Exibe o resultado e salva o arquivo de imagem no formato JPEG
figure,imshow(A)

imwrite(A,'C:\Users\Edu\Desktop\Nova pasta\Imagens para teste\Compressed\image.JPEG');
