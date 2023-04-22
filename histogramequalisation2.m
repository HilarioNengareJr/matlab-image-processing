% second method to solving the histogram equalization
close all;
clear all;
clc
warning off;
% Read the image
lenna = imread('/MATLAB Drive/read.png');
% Converting the image to a grayscale
lenna = rgb2gray(lenna);
lennaSize = size(lenna);
lenna = double(lenna);

% Looping to attain the original image histogram
freqCount = zeros(1,256);
for i=1:lennaSize(1)
    for j=1:lennaSize(2)
        for k=0:255
            if lenna(i,j) == k
                freqCount(k+1) = freqCount(k+1)+1;
            end
        end
    end
end

% Calculating PDF out of histogram by dividing total num of pixels
pdf = (1/(lennaSize(1)*lennaSize(2))) * freqCount;

% Calculating CDF out of PDF
cdf = zeros(1,256);
cdf(1) = pdf(1);
for i = 2:256
    cdf(i) = cdf(i-1) + pdf(i);
end
cdf = round(255*cdf);

% The histogram equalised image
ep = zeros(lennaSize);
% Traversing the rows of image 
for i=1:lennaSize(1)
    % Traversing the columns of the image
    for j=1:lennaSize(2)
        % pixel values 
        pxValue = (lenna(i,j) + 1);
        ep(i,j) = cdf(pxValue);
    end
end

% Achieving the Histogram for the Equalised Image
newHist = zeros(1,256);
for i=1:lennaSize(1)
    for j=2:lennaSize(2)
        for k=0:255
            if ep(i,j) == k
                newHist(k+1) = newHist(k+1)+1;
            end
        end
    end
end

subplot(2,2,1);
imshow(uint8(lenna));
title('Original Image');
subplot(2,2,3);
imshow(uint8(ep));
title('Histogram Equalised Image');
subplot(2,2,2);
stem(freqCount);
title('Histogram for the Original Image');
subplot(2,2,4);
stem(newHist);
title('Histogram of Equalised Image');
