%% Black_White_Bars
% Create a 256 X 256 image that consists of alternating black and white
% vertical bars,
% beginning with black at the far left.
% Black bars should have a gray level of 0,and white bars should have a
% gray level of 255.
% There should be 16 total bars in the image. 
% The image should contain no other gray level values except 0 or 255.

% %%
% A=zeros(256);  % 256x256 matrix filled with zeros
% 
% %%
% 
% for x=1:32:255
%     A(1:255,x+16:x+31)=255; % Generating alternating white bars and storing it in the form of matrix
% end

A=zeros(64);  % 256x256 matrix filled with zeros

%%

for x=1:8:64
    A(1:64,x+4:x+7)=255; % Generating alternating white bars and storing it in the form of matrix
end
%% 
Af = abs(fft2(A));

figure
ip_dispsc(fftshift(Af))

figure
ip_disp(A)