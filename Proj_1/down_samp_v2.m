function down_samp_v2()
% Reduce the effective spatial sample rate for LENA 
% Does NOT maintain same image size 
% Progressively downsamples the previous downsampled result.
% Note: No filtering is applied!
%
% Assumes the lena.mat file is in the current directory.
% 
% Copyright 2005, 2011 Cameron H. G. Wright


% get the image matrix A
load lena A;

A=double(A);
AA=zeros(256,256);

% we know A is 256x256 
% generate the downsampled images
% make all 256x256 black for comparison
%  of size
A2=zeros(256,256); 
for i=1:2:256
    for j=1:2:256
        A2((i+1)/2,(j+1)/2)=A(i,j); % 128x128
    end
end

A4=zeros(256,256); 
for i=1:2:128
    for j=1:2:128
        A4((i+1)/2,(j+1)/2)=A2(i,j); % 64x64
    end
end

A8=zeros(256,256); 
for i=1:2:64
    for j=1:2:64
        A8((i+1)/2,(j+1)/2)=A4(i,j); % 32x32
    end
end

A16=zeros(256,256); 
for i=1:2:32
    for j=1:2:32
        A16((i+1)/2,(j+1)/2)=A8(i,j); % 16x16
    end
end

A32=zeros(256,256); 
for i=1:2:16
    for j=1:2:16
        A32((i+1)/2,(j+1)/2)=A16(i,j); % 8x8
    end
end

A64=zeros(256,256); 
for i=1:2:8
    for j=1:2:8
        A64((i+1)/2,(j+1)/2)=A32(i,j); % 4x4
    end
end

A128=zeros(256,256); 
for i=1:2:4
    for j=1:2:4
        A128((i+1)/2,(j+1)/2)=A64(i,j); %2x2
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
title('Downsampled to 128x128')

figure(3)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A4) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Downsampled to 64x64')

figure(4)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A8) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Downsampled to 32x32')

figure(5)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A16) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Downsampled to 16x16')

figure(6)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A32) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Downsampled to 8x8')

figure(7)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A64) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Downsampled to 4x4')

figure(8)
set(gcf,'Position',FigPos)%,'visible','off')
imagesc([0 255],[0 255],A128) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Downsampled to 2x2')

figure(9)
set(gcf,'Position',FigPos)%,'visible','off')
subplot(2,4,1)
ip_dispsc(A)
axis off
subplot(2,4,2)
ip_dispsc(A2)
axis off
subplot(2,4,3)
ip_dispsc(A4)
axis off
subplot(2,4,4)
ip_dispsc(A8)
axis off
subplot(2,4,5)
ip_dispsc(A16)
axis off
subplot(2,4,6)
ip_dispsc(A32)
axis off
subplot(2,4,7)
ip_dispsc(A64)
axis off
subplot(2,4,8)
ip_dispsc(A128)
axis off



% step through figures in increasing order at each key press
figure(1)
pause
figure(2)
pause
figure(3)
pause
figure(4)
pause
figure(5)
pause
figure(6)
pause
figure(7)
pause
figure(8)
pause
figure(9)

