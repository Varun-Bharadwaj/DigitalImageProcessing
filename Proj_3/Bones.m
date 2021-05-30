I = double(A);

figure()
ip_disp(A)
title('(a) Original Image')
% print('(a) Original Image','-djpeg');
%Laplacian
F = [1 1 1; 1 -8 1; 1 1 1];
L = ib_filt(I,F);

Ls = ip_scalegray(L,8);

figure()
ip_disp(Ls);
title("(b) Laplacian of original image")
% print('(b) Laplacian of original image','-djpeg');

Sl = I - L;

figure()
ip_disp(Sl);
title('(c) Sharpned image obtained by adding (b) with original image')
% print('(c) Sharpned image obtained by adding (b) with original image','-djpeg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Sobel Gradient

Fh = [-1 -2 -1; 0 0 0; 1 2 1];
Fv = [-1 0 1; -2 0 2; -1 0 1];
% Fd1 = [0 -1 -2; 1 0 -1; 2 1 0];
% Fd1 = [-2 -1 0; -1 0 1; 0 1 2];
F4 = ones(5);
F4 = F4 * (1/25);

gx = ib_filt(I,Fh);
gy = ib_filt(I,Fv);
% D = ib_filt(I,Fd1);
% D1 = ib_filt(I,d2);

S = abs(gx) + abs(gy);
Sa = ib_filt(S,F4);

figure()
ip_disp(S)
title('(d) Sobel of original image')
% print('(d) Sobel of original image','-djpeg');

figure()
ip_disp(Sa)
title('(e) Sobel image smoothed with 5x5 box filter')
% print('(e) Sobel image smoothed with 5x5 box filter','-djpeg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Mask formed by the product of (c) and (e)
SlM = ip_scalegray(Sl,1);
SaM = ip_scalegray(Sa,1);
M = SlM.*SaM;
Ms = ip_scalegray(M,8);
figure()
ip_disp(Ms)
title('(f) Mask formed by the product of (c) and (e)')
% print('(f) Mask formed by the product of (c) and (e)','-djpeg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Sharpned image obtained by adding (f) with original image

Sm  = I + Ms;

figure()
ip_disp(Sm)
title('(g)Sharpned image obtained by adding (f) with original image')
% print('(g)Sharpned image obtained by adding (f) with original image','-djpeg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%power law

P = (double(A).^0.5);

Ps = ip_scalegray(P,8);

figure()
ip_disp(Ps)
title('(h) Result obtained by applying power law transformation')
% print('(h) Result obtained by applying power law transformation','-djpeg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%