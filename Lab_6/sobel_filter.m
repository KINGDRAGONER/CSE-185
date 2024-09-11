function img_filtered = sobel_filter(img, kernel)
    [rows, cols] = size(img);
    [kernel_rows, kernel_cols] = size(kernel);
    img_filtered = zeros(rows, cols);

    for u = 1 + floor(kernel_cols / 2) : cols - floor(kernel_cols / 2)
        for v = 1 + floor(kernel_rows / 2) : rows - floor(kernel_rows / 2)
            patch = img(v - floor(kernel_rows / 2) : v + floor(kernel_rows / 2),u - floor(kernel_cols / 2) : u + floor(kernel_cols / 2));
            img_filtered(v, u) = sum(patch(:) .* kernel(:));
        end
    end
end
