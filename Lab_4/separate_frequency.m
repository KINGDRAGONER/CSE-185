function [low_pass_img, high_pass_img] = separate_frequency(img, ratio)
%% apply FFT
frequency_map = fft2(img);
%% shift the frequency map
frequency_map_shifted = fftshift(frequency_map);
%% compute low-frequency mask
    height = size(img, 1);
    width = size(img, 2);
    Xo = floor(width/2);
    Yo = floor(height/2);
    
    y1 = Yo - floor(ratio*(height/2));
    y2 = Yo + floor(ratio*(height/2));
    x1 = Xo - floor(ratio*(width/2));
    x2 = Xo + floor(ratio*(width/2));
    
    mask = zeros(size(img));
    mask(y1 : y2, x1 : x2, :) = 1;
%% separate low-frequency and high-frequency maps
low_pass_map = double(frequency_map_shifted) .* mask;
high_pass_map = double(frequency_map_shifted) .* (1 - mask);
%% shift frequency maps back
low_pass_map_shifted = ifftshift(low_pass_map);
high_pass_map_shifted = ifftshift(high_pass_map);
%% apply Inverse FFT
low_pass_img = real(ifft2(low_pass_map_shifted));
high_pass_img = real(ifft2(high_pass_map_shifted));
end
