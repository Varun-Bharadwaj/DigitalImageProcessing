load proj_IR;
B = ib_bi_int(IR,1536,2048); % Interpolating IR image so that its same dimension as Visible

% Scaling and alignment of visible image
T = ib_translate(visible,-384,-512);
S = ib_scale(T,0.40625,0.40625);
Tt = ib_translate(S,-142,-276);

I = Tt;
I(1389:1536,1:2048) = I(1244:1391,1:2048);
I(1:1536,1768:2048) = I(1:1536,1490:1770);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fh = [-1 -2 -1; 0 0 0; 1 2 1]; % Horizontal Mask
Fv = [-1 0 1; -2 0 2; -1 0 1]; % Vertical Mask
Fd1 = [0 -1 -2; 1 0 -1; 2 1 0]; % Diagonal Mask
Fd2 = [-2 -1 0; -1 0 1; 0 1 2]; % Diagonal Mask
gx = ib_filt(I,Fh);
gy = ib_filt(I,Fv);
g1 = ib_filt(I,Fd1);
g2 = ib_filt(I,Fd2);
F4 = ones(5);
F4 = F4 * (1/25); % 5x5 averaging mask

As = abs(gx) + abs(gy) + abs(g1) + abs(g2);
Ass = ib_filt(As,F4);
Ass = 255 - Ass;
a = 0.8;
V = a.*B + (1-a).*Ass; % Image Fusion

figure
ip_disp(V)
title('Final fused image')