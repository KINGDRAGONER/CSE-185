img = im2double(imread('lena.jpg'));
%% Sobel filter
H = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge
img_sobel = sobel_filter(img, H);
figure, imshow(img_sobel);
imwrite(img_sobel, 'sobel_h.jpg');
%H change
H = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge
img_sobel = sobel_filter(img, H);
figure, imshow(img_sobel);
imwrite(img_sobel, 'sobel_v.jpg');


%% Gaussian filter
hsize = 5; sigma = 2;
img_gaussian = gaussian_filter(img, hsize, sigma);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'gaussian_5.jpg');
%padding change
hsize = 9; sigma = 4;
img_gaussian = gaussian_filter(img, hsize, sigma);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'gaussian_9.jpg');

