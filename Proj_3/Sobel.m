I = double(A);

F = [-1 -2 -1; 0 0 0; 1 2 1];
F1 = [-1 0 1; -2 0 2; -1 0 1];
% F2 = [0 -1 -2; 1 0 -1; 2 1 0];
% F3 = [-2 -1 0; -1 0 1; 0 1 2];
F4 = ones(5);
F4 = F4 * (1/25);

O = ib_filt(I,F);
V = ib_filt(I,F1);
% D = ib_filt(I,F2);
% D1 = ib_filt(I,F3);

Q = abs(O) + abs(V);
R = ib_filt(Q,F4);

% R = ip_scalegray(R,8);

figure()
ip_disp(Q)
title('Sobel Gradient')

figure()
ip_disp(R)
title('5x5 on sobel image')