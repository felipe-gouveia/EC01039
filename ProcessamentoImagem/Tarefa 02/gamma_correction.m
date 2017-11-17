function gamma_correction = gamma_correction(image_gray, gamma_value)

image_gray = double(image_gray);
[i, j] = size(image_gray);

% Extremos de Intensidade da Entrada
gray_min = double(min(min(image_gray)));
gray_max = double(max(max(image_gray)));

% Determine the amount to "shift/move" pixel intensity values by
%shift_val = gray_min - gamma_min;

% Valor de esccala para ajuste antes de implementar a correção gama
escala = double(1)/(gray_max-gray_min);

% Diminuimos a escala dos pixels para realizar a correção gamma
for rows = 1:i
 for columns = 1:j
 image_gray(rows, columns)=(image_gray(rows, columns))*double(escala);
 end
end

% Correção Gamma
for rows = 1:i
 for columns = 1:j
 image_gray(rows, columns)=(image_gray(rows, columns)).^gamma_value;
 end
end

% Convertemos de volta para uint8 e arredondamos os valores
% Escalamos de 0:255 e retornamos
gamma_correction = uint8(round(image_gray*gray_max));