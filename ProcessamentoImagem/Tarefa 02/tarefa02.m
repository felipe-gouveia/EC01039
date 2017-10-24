%% Computação Gráfica e Processamento Digital de Imagens - Tarefa 02

%  Descrição
%  ------------
%
%  Este arquivo contém o código para solução do arquivo tarefa02.pdf
%  Autor: Felipe Rodrigues Veludo Gouveia
%  Data: 24-10-2017
%
%  Funções associadas:
%  --------------------
%     grayscale.m
%
%
%   Obs: Os Warnings de imagens grandes foram desligados na linha 21 para
%   maior fluidez de execução.
%

%% Inicialização
clear ; close all; clc
warning('off', 'Images:initSize:adjustingMag'); % desligando warning de imagem muito grande

%% ==================== Questão 1: Implementar uma rotina para converter imagens para grayscale ===================
fprintf('Questão 1: Implementar uma rotina para converter imagens para grayscale.\n');
image_rgb = imread('starry_night.jpg'); %
[image_gray] = grayscale(image_rgb);

imwrite(image_gray, 'imagem_cinza.jpg')

figure('Name','Imagem Original x Imagem Cinza'), imshowpair(image_rgb, image_gray, 'montage')

fprintf('Programa pausado. Pressione ENTER para continuar para próxima questão.\n');
pause;

%% ==================== Questão 2: Implementar uma rotina para calcular e exibir o histograma da imagem cinza  ===================
fprintf('Questão 2: Implementar uma rotina para calcular e exibir o histograma da imagem cinza.\n');

figure;
hist_gray = imhist(image_gray);

imhist(image_gray), title('Histograma da Image Cinza');
xlabel('Valores dos Níveis de Cinza', 'fontsize', 10);
ylabel('Quantidade de Pixels da Imagem', 'fontsize', 10);

fprintf('Programa pausado. Pressione ENTER para continuar para próxima questão.\n');
pause;

%% ==================== Questão 3: Implementar uma rotina para Transformação de Intensidade, Histogramas  ===================
fprintf('Questão 3: Implementar uma rotina para Transformação de Intensidade, Histogramas.\n');
g1 = imadjust(image_gray, [0 1], [1 0], 1.5);
g2 = imadjust(image_gray, [0 1], [1 0], 0.5);

%g1 = gammac(image_gray, 1.5);
%g2 = gammac(image_gray, 0.5);

% Gamma = 1.5
figure('Name','Imagem Original x Imagem Transformada com Gamma = 1.5'), imshowpair(image_gray, g1, 'montage');
figure('Name','Histogramas da Imagem Original x Imagem Transformada com Gamma = 1.5');
subplot(1,2,1), imhist(image_gray), title('Histograma da Imagem Original');
subplot(1,2,2), imhist(g1), title('Histograma da Transformação de Intensidade com Gamma = 1.5');
imwrite(g1, 'transf_int_gamma15.jpg');

% Gamma = 0.5
figure('Name','Imagem Original x Imagem Transformada com Gamma = 0.5'), imshowpair(image_gray, g2, 'montage');
figure('Name','Histogramas da Imagem Original x Imagem Transformada com Gamma = 0.5');
subplot(1,2,1), imhist(image_gray), title('Histograma da Imagem Original');
subplot(1,2,2), imhist(g2), title('Histograma da Transformação de Intensidade com Gamma = 0.5');
imwrite(g2, 'transf_int_gamma05.jpg');

% Como exportar histogramas para imagem ou figuras para imagem?
%imwrite(imhist(g1) ,'hist15.jpg');
%imwrite(imhist(g2) ,'hist05.jpg');

% Funções de Mapeamento?
figure;
subplot(1,2,1);plot(( 0:0.01:size(g1)).^1.5);axis tight;
legend('Para Gamma = 1.5');

subplot(1,2,2);plot(( 0:0.01:size(g2)).^0.5);axis tight;
legend('Para Gamma = 0.5');

fprintf('Programa pausado. Pressione ENTER para continuar para próxima questão.\n');
pause;

%% ==================== Questão 4: Implementar uma rotina para Equalização de Histogramas  ===================
fprintf('Questão 4: Implementar uma rotina para Equalização de Histogramas.\n');
imagem_equalizada = histeq(image_gray);

figure('Name','Imagem Original x Imagem Equalizada'), imshowpair(image_gray,imagem_equalizada,'montage');
figure('Name','Histogramas da Imagem Original x Imagem Equalizada');
subplot(1,2,1), imhist(image_gray), title('Histograma da Imagem Original');
subplot(1,2,2), imhist(imagem_equalizada), title('Histograma da Imagem Equalizada');

fprintf('Tarefa 02 concluída.\n');

