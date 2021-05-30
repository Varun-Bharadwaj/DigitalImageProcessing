function down_samp()
% Reduce the effective spatial sample rate for "mystery" image 
% Maintains same image size by duplicating pixels
% Downsamples from the original each time, rather than
% progressively downsampling the previous result.
% Note: No filtering is applied!
%
% Assumes the the image mat file is in the current directory.
% 
% Copyright 2004, 2011 Cameron H. G. Wright


% get the image matrix A
load lena A;

% we know A is 256x256
% generate the downsampled images
factor=2;
A2=zeros(256,256);
for i=1:factor:256
    for j=1:factor:256
        A2(i:i+factor-1,j:j+factor-1)=A(i,j);
    end
end

factor=4;
A4=zeros(256,256);
for i=1:factor:256
    for j=1:factor:256
        A4(i:i+factor-1,j:j+factor-1)=A(i,j);
    end
end

factor=8;
A8=zeros(256,256);
for i=1:factor:256
    for j=1:factor:256
        A8(i:i+factor-1,j:j+factor-1)=A(i,j);
    end
end

factor=16;
A16=zeros(256,256);
for i=1:factor:256
    for j=1:factor:256
        A16(i:i+factor-1,j:j+factor-1)=A(i,j);
    end
end

factor=32;
A32=zeros(256,256);
for i=1:factor:256
    for j=1:factor:256
         A32(i:i+factor-1,j:j+factor-1)=A(i,j);
    end
end

factor=64;
A64=zeros(256,256);
for i=1:factor:256
    for j=1:factor:256
         A64(i:i+factor-1,j:j+factor-1)=A(i,j);
    end
end

factor=128;
A128=zeros(256,256);
for i=1:factor:256
    for j=1:factor:256
         A128(i:i+factor-1,j:j+factor-1)=A(i,j);
    end
end

%  display results
close all  % close all old figures

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
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Original image at 256x256')

figure(2)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A2) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x') 
title('Sampled at 128x128 and expanded')

figure(3)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A4) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Sampled at 64x64 and expanded')

figure(4)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A8) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Sampled at 32x32 and expanded')

figure(5)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A16) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Sampled at 16x16 and expanded')

figure(6)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A32) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Sampled at 8x8 and expanded')

figure(7)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A64) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Sampled at 4x4 and expanded')

figure(8)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A128) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Sampled at 2x2 and expanded')

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

