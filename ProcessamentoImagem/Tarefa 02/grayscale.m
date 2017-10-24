function [image_gray] = grayscale(image_rgb)

  [r, c, channels] = size(image_rgb);
  if channels  == 3
      % Possui 3 canais, então é RGB
      red = image_rgb(:, :, 1);
      green = image_rgb(:, :, 2);
      blue = image_rgb(:, :, 3);
      
      % Imagem Cinza
      image_gray = 0.33 * red + 0.33 * green + 0.33 * blue;
      
  else
      % It's already gray scale.
      image_gray = imagem_rgb;  % Input image is not really RGB color.
  end
  
end