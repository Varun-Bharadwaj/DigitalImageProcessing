I = A;

Q = (double(A).^0.5);

B = ip_scalegray(Q,8);

figure()
ip_disp(B)