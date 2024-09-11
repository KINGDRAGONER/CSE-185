%-----------
%logic

%saving: copy paste this and change below name in '' and imwrite
function output = median_filter(img, patch_size)
    [i, p] = size(img);
    % Create a matrix
    patches = im2col(img, patch_size, 'sliding');

    % Apply median filter to each patch
    median_values = median(patches);

    % Reshape
    output = col2im(median_values, patch_size, [i,p], 'sliding');
end
%---------
