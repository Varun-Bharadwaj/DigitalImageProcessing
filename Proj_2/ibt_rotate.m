function ibt_rotate (IN, theta)

IN = double(IN);
[X,Y] = size(IN);
Z = zeros(X,Y);

A = [cosd(theta) -sind(theta) 0; sind(theta) cosd(theta) 0; 0 0 1];
A = double(A);

for i = 1:X
    for j = 1:Y
        Xd = i*cosd(theta) + j*sind(theta);
        Yd = -i*sind(theta) + j*cosd(theta);
%         Xdf = floor(Xd);
%         Ydf = floor(Yd);
%         dx = Xd - Xdf;
%         dy = Yd - Ydf;
%         S = round(Xd);
%         G = round(Yd);
%         Z(S,G) = (1-dy)*(1-dx)*IN(i,j)+dx*IN(i+1,j) + dy*(1-dx)*IN(i,j+1)+dx*IN(i+1,j+1);
        S = round(Xd);
        G = round(Yd);
        if (G>0 && S>0 && S<X && G<Y) 
            Z(i,j) = IN(S,G);
        end
    end
end

figure
ip_disp(IN)

figure
ip_disp(Z)