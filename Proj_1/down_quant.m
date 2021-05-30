function down_quant()
% Reduce the effective graylevel quantization rate for LENA 
% 
% Assumes the lena.mat file is in the current directory.
% 
% Copyright 2004 Cameron H. G. Wright

% get the image matrix A
load lena A;

%  display results
close all % close all old figures

scrsz = get(0,'ScreenSize'); % get the screen size 
% Vista and Win7 have a 31 pixel task bar at bottom
Los=10; % left offset
Bos=55; % bottom offset
Ros=20; % right offset
Tos=145; % top ofset
FigPos=[scrsz(1)+Los scrsz(2)+Bos scrsz(3)-Ros scrsz(4)-Tos];

% Uses "imagesc" instead of "image" for display.
%  This is atypical--you should use "image" for most IP routines.

figure(1)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis equal 
axis tight
colormap(gray(256)) % use an 8-bit grayscale 
xlabel('y')
ylabel('x')
title('256 gray levels')

figure(2)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis equal 
axis tight
colormap(gray(128)) % use a 7-bit grayscale 
xlabel('y')
ylabel('x')
title('128 gray levels')

figure(3)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis equal 
axis tight
colormap(gray(64)) % use a 6-bit grayscale 
xlabel('y')
ylabel('x')
title('64 gray levels')

figure(4)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis equal 
axis tight
colormap(gray(32)) % use a 5-bit grayscale 
xlabel('y')
ylabel('x')
title('32 gray levels')

figure(5)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis equal 
axis tight
colormap(gray(16)) % use a 4-bit grayscale 
xlabel('y')
ylabel('x')
title('16 gray levels')

figure(6)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis equal 
axis tight
colormap(gray(8)) % use a 3-bit grayscale 
xlabel('y')
ylabel('x')
title('8 gray levels')

figure(7)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis equal 
axis tight
colormap(gray(4)) % use a 2-bit grayscale 
xlabel('y')
ylabel('x')
title('4 gray levels')

figure(8)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis equal 
axis tight
colormap(gray(2)) % use a 1-bit grayscale 
xlabel('y')
ylabel('x')
title('2 gray levels')

% make visible and step through figures in reverse order at each key press
figure(8)
pause
figure(7)
pause
figure(6)
pause
figure(5)
pause
figure(4)
pause
figure(3)
pause
figure(2)
pause
figure(1)



