function equalize_histogram = equalize_histogram(image_gray)

%Inicializações
rows = size(image_gray, 1);
columns = size(image_gray , 2);
numero_pixels = rows * columns;

somatorio = 0;
escala = 255;

ocorrencia_pixel = zeros(256, 1);
probabilidade_ocorrencia = zeros(256, 1);

cumulativa = zeros(256, 1);
probabilidade_cumulativa = zeros(256, 1);

saida = zeros(256, 1);

histograma_equalizado = uint8(zeros(size(image_gray,1), size(image_gray,2)));

for i=1:rows
    for j=1:columns
        pixel_value = image_gray(i,j);
        ocorrencia_pixel(pixel_value + 1) = ocorrencia_pixel(pixel_value + 1) + 1;
        probabilidade_ocorrencia(pixel_value + 1) = ocorrencia_pixel(pixel_value + 1) / numero_pixels;
    end
end

for i=1:size(probabilidade_ocorrencia)

   somatorio = somatorio + ocorrencia_pixel(i);
   cumulativa(i) = somatorio;
   probabilidade_cumulativa(i)= cumulativa(i) / numero_pixels;
   saida(i) = round(probabilidade_cumulativa(i) * escala);
end

for i=1:rows
    for j=1:columns
            histograma_equalizado(i,j) = saida(image_gray(i,j) + 1);
    end
end

equalize_histogram = histograma_equalizado;