close all;
clear all;
clc
warning off;
% Reading a color image 
Img = imread('/MATLAB Drive/read.png');
%Converting it to a grayscale image
Img = rgb2gray(Img);
figure
subplot(1,2,1);
% Showing the image
imshow(Img); 
% Displaying the title
title('Original Image');
% Plot the image data
subplot(1,2,2)
% Plot the histogram and label the title as Histogram
imhist(Img);
title('Histogram');
% Histogram equalisation
eqImg = histeq(Img);
figure
subplot(1,2,1);
imshow(eqImg);title('Histogram Equalised Image');
subplot(1,2,2);
imhist(eqImg); title('Histogram');


