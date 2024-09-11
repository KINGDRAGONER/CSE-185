function img_filtered = gaussian_filter(img, hsize, sigma)
    kernel = fspecial('gaussian', hsize, sigma);
    [rows, cols] = size(img);
    img_filtered = zeros(rows, cols);

    for u = 1 + floor(size(kernel, 2) / 2) : cols - floor(size(kernel, 2) / 2)
        for v = 1 + floor(size(kernel, 1) / 2) : rows - floor(size(kernel, 1) / 2)
            patch = img(v - floor(size(kernel, 1) / 2) : v + floor(size(kernel, 1) / 2), u - floor(size(kernel, 2) / 2) : u + floor(size(kernel, 2) / 2));
            img_filtered(v, u) = sum(patch(:) .* kernel(:));
        end
    end
end
