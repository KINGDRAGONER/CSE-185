function [output, match] = template_matching_SSD(img, template, threshold)
    % Initialize output matrix
    output = zeros(size(img));

    % Define shift values
    shift_u = floor(size(template, 2) / 2);
    shift_v = floor(size(template, 1) / 2);

    % Perform template matching with SSD
    for u = 1 + shift_u : size(img, 2) - shift_u
        for v = 1 + shift_v : size(img, 1) - shift_v
            x1 = u - shift_u; % Define left boundary of template patch
            x2 = u + shift_u; % Define right boundary of template patch
            y1 = v - shift_v; % Define top boundary of template patch
            y2 = v + shift_v; % Define bottom boundary of template patch

            patch = img(y1:y2, x1:x2); % Extract template patch

            % SSD
            value = sum(sum((patch - template).^2)); % Compute SSD
            output(v, u) = value;
        end
    end

    % Threshold the SSD values
    match = (output < threshold);
end
