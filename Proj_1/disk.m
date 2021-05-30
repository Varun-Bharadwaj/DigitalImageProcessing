%% Concentric Disks
% Create a 256256 image that consists of two concentric disks, centered in the \middle" of the image.
% The larger disk should have a radius of 64 pixels and a gray scale value equivalent to 127. The smaller
% disk should have a radius of 32 pixels and a gray scale value equivalent to 255. The background of
% the image should be black.

%% 
tic
C=zeros(256); % 256x256 matrix filled with zeros
D=zeros(256); % 256x256 matrix filled with zeros
a=127; % Center of the circle
R=64; % Radius of the bigger disk
R1=32; % Radius of the smaller disk
%% 

for i=1:256
    for j=1:256
        C(i,j)=(i-a).^2+(j-a).^2<= R.^2; % Generating a disk and obtaining its binary matrix
    end
end
%% 

I = 0.498*uint8(255 * C); % Conversion of values from range (0-1) to (0-127)
%% 

for i=1:256
    for j=1:256
        D(i,j)=(i-a).^2+(j-a).^2<= R1.^2; % Generating a disk and obtaining its binary matrix
    end
end
%% 

I1 = uint8(255 * D); % Conversion of values from range (0-1) to (0-255)
img=I+I1; % Summing up the images of the disks to get the result
%% 

figure
imshow(img) % display
axis on
axis ij
axis equal
axis tight
toc