I = double(visible);
I1 = double(IR);
C = ib_bi_int(IR,1536,2048);

% Laplacian
F = [1 1 1; 1 -8 1; 1 1 1];
L = ib_filt(I,F);

% Sharpned image by adding laplcian with original image
Sl = I - L;

%Sobel Gradient
Fh = [-1 -2 -1; 0 0 0; 1 2 1];
Fv = [-1 0 1; -2 0 2; -1 0 1];
F4 = ones(5);
F4 = F4 * (1/25);

gx = ib_filt(I,Fh);
gy = ib_filt(I,Fv);

S = abs(gx) + abs(gy);
Sa = ib_filt(S,F4);

SlM = ip_scalegray(Sl,1);
SaM = ip_scalegray(Sa,1);
M = SlM.*SaM;
Ms = ip_scalegray(M,8);

% Sm = I + Ms;
Sm = C + Ms;

% figure
% ip_disp(I)
% title('Original image')
% 
figure
ip_disp(Sm)
title('Sharpned image')