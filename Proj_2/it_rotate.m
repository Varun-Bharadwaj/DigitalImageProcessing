% function it_rotate (IN, theta)
IN = imread('Proj_002_image2.tif');
% load lena
% IN = A512;
theta = 21;
[xog,yog] = size(IN);
B = zeros(xog,yog);
tic
for j=1:yog 
    for i=2:xog-1    
        Xd = (i-1)*cosd(theta) - (j-1)*sind(theta);
        if(Xd>1 && Xd<xog)
            Xdf = floor(Xd);
            dx = Xd - Xdf;
            B(i,j) = IN(Xdf,j)*(1-dx) + IN(Xdf+1,j)*dx;
        end
    end
end

C = zeros(xog,yog);

for i=1:xog
    for j=2:yog-1
        Yd = (i-1)*sind(theta) + (j-1)*cosd(theta);
        Xd = (i-1)*cosd(theta) - (j-1)*sind(theta);
        if(Yd>1 && Yd<yog)
            if(Xd>1 && Xd<xog)
                Ydf = floor(Yd);
                dy = Yd-Ydf;
                C(i,j) = B(i,Ydf)*(1-dy) + B(i,Ydf+1)*dy;
            end
        end
    end
end
toc
C = round(C);

figure
ip_disp(IN);
title("Original Image");

figure
ip_disp(C);
title("Interpolated Image");