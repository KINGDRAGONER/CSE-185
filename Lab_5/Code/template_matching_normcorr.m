function [output, match] = template_matching_normcorr(img, template, threshold)
    % Initialize output matrix
    output = zeros(size(img));

    % Define shift values
    shift_u = floor(size(template, 2) / 2);
    shift_v = floor(size(template, 1) / 2);

    for u = 1 + shift_u : size(img, 2) - shift_u
        for v = 1 + shift_v : size(img, 1) - shift_v
            x1 = u - shift_u;
            x2 = u + shift_u; 
            y1 = v - shift_v; 
            y2 = v + shift_v; 

            patch = img(y1:y2, x1:x2); 

            % Normalized Cross-Correlation
            template_mean = mean(template(:));
            patch_mean = mean(patch(:)); 
            numerator = sum(sum((patch - patch_mean) .* (template - template_mean)));
            denominator = sqrt(sum(sum((patch - patch_mean).^2)) * sum(sum((template - template_mean).^2)));

            value = numerator / denominator;
            output(v, u) = value;
        end
    end

    match = (output > threshold);
end

