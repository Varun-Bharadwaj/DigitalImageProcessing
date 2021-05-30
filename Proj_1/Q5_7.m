close all

A=zeros(256);  % 256x256 matrix filled with zeros

for x=1:32:255
    A(1:255,x+16:x+31)=255;
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

figure
imagesc([0 255],[0 255],A16) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Bars Sampled at 16x16')

figure
imagesc([0 255],[0 255],A32) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Bars Sampled at 8x8')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


B=zeros(256); % 256x256 matrix filled with zeros

% sin(2*pi*f*t) is the general format
% f=1/32
% 2*pi*f=0.1963

for i=1:256
    for j=1:256
        B(i,j)=-sin(0.1963*j);
    end
end
        
B=B+1;  % range 0 to 2
B=127.5*B;  % range 0 to 255

factor=2;
B2=zeros(256,256);
for i=1:factor:256
    for j=1:factor:256
         B2(i:i+factor-1,j:j+factor-1)=B(i,j);
    end
end

factor=4;
B4=zeros(256,256);
for i=1:factor:256
    for j=1:factor:256
         B4(i:i+factor-1,j:j+factor-1)=B(i,j);
    end
end

factor=8;
B8=zeros(256,256);
for i=1:factor:256
    for j=1:factor:256
         B8(i:i+factor-1,j:j+factor-1)=B(i,j);
    end
end

figure
imagesc([0 255],[0 255],B2) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Sampled at 128x128')

figure
imagesc([0 255],[0 255],B4) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Sampled at 64x64')

figure
imagesc([0 255],[0 255],B8) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
xlabel('y')
ylabel('x')
title('Sampled at 32x32')