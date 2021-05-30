close all

A=zeros(256);  % 256x256 matrix filled with zeros

for x=1:32:255
    A(1:255,x+16:x+31)=255;
end

figure(1)
image([0 255],[0 255],A) % display
axis ij
axis equal
axis tight
colormap(gray(256)) %grayscale

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

figure(2)
image([0 255],[0 255],B) % display
axis ij 
axis equal
axis tight
colormap(gray(256)) % grayscale

% theta=0:255/1000:255;
% X=(a+R*cos(theta));
% Y=(a+R*sin(theta));
% w1=max(X);
% w=min(X);
% q1=max(Y);
% q=min(Y);
% X=256;
% Y=256;
% [col,row]= meshgrid(1:X,1:Y);
% a=127;
% R=64;
% img=(row-a).^2+(col-a).^2<= R.^2;
% imshow(img);

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
figure(3)
imshow(img)
axis on
axis ij
axis equal
axis tight

figure(1)