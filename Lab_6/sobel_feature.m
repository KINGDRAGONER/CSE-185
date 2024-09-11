function [magnitude, orientation] = sobel_feature(img)
    % horizontal edge
    Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
    % vertical edge
    Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1];

    %% Sobel filtering
    horiSobel = sobel_filter(img, Hy);
    vertiSobel = sobel_filter(img, Hx);
    %% compute gradient magnitude and orientation
    mag = sqrt(horiSobel.^2+vertiSobel.^2);
    ori = atan2(horiSobel, vertiSobel);
    %% compute gradient magnitude and orientation(we already did above just not using same var)
    magnitude = mag;
    orientation = ori;
end