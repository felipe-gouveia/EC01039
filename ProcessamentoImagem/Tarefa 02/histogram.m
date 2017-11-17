function histogram(input_image)

  intensidade = zeros(256, 1, 'int64');

    for i = 0:255
        intensidade(i+1) = (sum(input_image(:) == i));
    end
    bar(1:256, intensidade);


