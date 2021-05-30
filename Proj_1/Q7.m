C=zeros(256); % 256x256 matrix filled with zeros
D=zeros(256);
a=127;
R=64;
R1=32;
for i=1:256
    for j=1:256
        C(i,j)=(i-a).^2+(j-a).^2<= R.^2;
    end
end
I = uint8(255 * C);
I=I*0.498;

for i=1:256
    for j=1:256
        D(i,j)=(i-a).^2+(j-a).^2<= R1.^2;
    end
end
I1 = uint8(255 * D);
img=I+I1;

factor=32;
img8=zeros(256,256);
for i=1:factor:256
    for j=1:factor:256
         img8(i:i+factor-1,j:j+factor-1)=img(i,j);
    end
end

figure
imagesc([0 255],[0 255],img8) % display a matrix as an image
axis ij  % put 0,0 in UL corner
axis square
colormap(gray(256)) % use an 8-bit grayscale 
caxis([0 255]) % sets min and max limits of colormap
title('Sampled at 16x16')
xlabel('y')
ylabel('x')

figure
imshow(img)
axis on
axis ij
axis equal
axis tight
