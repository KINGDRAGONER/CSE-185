img = im2double(imread('lena.jpg'));
sigma = 2.0;
hsize = 7;
scale = 5;
%% Gaussian Pyramid
I = img;
Iguas = I;
for s = 1 : scale
    % Gaussian filter
    Iguas = gaussian_filter(Iguas, hsize, sigma);
    
    % Save or show image
    imwrite(Iguas, sprintf('Gaussian_scale%d.jpg', s));
    
    % Down-sampling
    Iguas = imresize(Iguas, 0.5);
    
end


%% Laplacian Pyramid
Ilap = I;
for s = 1 : scale
    % Gaussian filtering
    Ilap_filtered = gaussian_filter(Ilap, hsize, sigma);
    % Laplacian filtering
    Laplacian = Ilap - Ilap_filtered;
    % Save or show image
    imwrite(Laplacian + 0.5, sprintf('Laplacian_scale%d.jpg', s));
    % Down-sampling
    Ilap = imresize(Ilap, 0.5);

end



