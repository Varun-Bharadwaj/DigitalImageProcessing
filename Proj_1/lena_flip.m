%% Lena Flip
% Load the \lena.mat" data file from the course web site Files-->Images section. This MAT file
% contains two data matrices that are images of Lena: a 256  256 version called A, and a 512  512
% version called A512. Both matrices contain pixel values as unsigned integers in the range of 0 to 255.
% For this part of the project, you will use the 512512 version. Display the image normally,
% display a version that has been 
% flipped" left to right, and display a version that is upside down.
%% 

load lena 
A=double(A512);
%% 

figure(1)
ip_disp(A); % display the orginal image
title("Original Image")
%% 

% flipping the images using inbuilt command
% B=flip(A); % upside down flip
% C=flip(A,2); %mirror flip
% ip_disp(B);
% ip_disp(C)

% Elapsed time when using inbuilt command is 0.250253 seconds.
%% 

B=A; % creating a copy of the image

for i=1:511
    A(1:512,i)=B(1:512,512-i); % interchanging the order of columns to get a mirror flip
end
%% 

figure(2)
ip_disp(A); %display the flipped image(mirror flip)
title("Mirror flip")
%% 

for i=1:511
    A(i,1:512)=B(512-i,1:512); % interchanging the order of rows to get a upside down flip
end
%% 

figure(3)
ip_disp(A); % display the upside down version of image
title("Upside Down Flip")
% Elapsed time when peforming operations pixel by pixel is 0.374090 seconds.
%% 

% Comparing the elapsed time of using inbuilt functions and that of
% performing the same operation pixel by pixel, we can conclude that the
% inbuilt functions are more optimised