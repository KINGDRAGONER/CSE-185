%assuming in this lab I will cover loops and ifs for mathlab and use them
%to change images or something of the sort. Also this and every lab will be
%organized a little more from now on to help myself and the reader.

%1) Rotate 01.jpg by 45 degrees using forward warping, and save as rotate_0.jpg

img = imread('01.jpg');
%new name: copy paste this

%logic---
angle = deg2rad(45);
[rows, cols, ~] = size(img);

rotateimg = zeros(size(img), 'uint8');
center = [cols/2, rows/2];

for y1 = 1:rows
    for x1 = 1:cols
        % Calculate the rotated coordinates
        x2 = cos(angle) * (x1 - center(1)) + sin(angle) * (y1 - center(2)) + center(1);
        y2 = -sin(angle) * (x1 - center(1)) + cos(angle) * (y1 - center(2)) + center(2);
        
        % Check if in bounds
        if (x2 >= 1 && x2 <= cols && y2 >= 1 && y2 <= rows)
            % FORWARD WORWAPING HERE
            rotateimg(round(y2), round(x2), :) = img(y1, x1, :);
        end
    end
end
%----
%saving: copy paste this and change below name in '' and imwrite
modifiedImagePath = fullfile(pwd, 'rotate_0.jpg');
imwrite(rotateimg, modifiedImagePath);
disp(['Image as: ' modifiedImagePath]);
%2)Rotate 01.jpg by 45 degrees using backward warping, and save as rotate_1.jpg

%new name: copy paste this

%logic---
rotateimg = zeros(size(img), 'uint8');
for y2 = 1:rows
    for x2 = 1:cols
        % Calculate the inverse rotated coordinates
        x1 = cos(angle) * (x2 - center(1)) + -sin(angle) * (y2 - center(2)) + center(1);
        y1 = sin(angle) * (x2 - center(1)) + cos(angle) * (y2 - center(2)) + center(2);
        
        % Check if in bounds
        if (x1 >= 1 && x1 <= cols && y1 >= 1 && y1 <= rows)
            % BACKWARD WARPING HERE
            rotateimg(y2, x2, :) = img(round(y1), round(x1), :);
        end
    end
end
%----
%saving: copy paste this and change below name in '' and imwrite
modifiedImagePath = fullfile(pwd, 'rotate_1.jpg');
imwrite(rotateimg, modifiedImagePath);
disp(['Image as: ' modifiedImagePath]);

%--------
%3. Implement median_filter.m for lena_noisy.jpg, use patch size = 3 and save the image as median_0.jpg
mg = im2double(imread('lena_noisy.jpg'));
% Median filter
patch_size = [3, 3];
% patch_size = [5, 5];
img_median = median_filter(mg, patch_size);
imwrite(img_median, 'median_0.jpg');

%----
%4. Implement median_filter.m for lena_noisy.jpg, use patch size = 3 and save the image as median_0.jpg
% Median filter
patch_size = [5, 5];
img_median2 = median_filter(mg, patch_size);
imwrite(img_median2, 'median_1.jpg');