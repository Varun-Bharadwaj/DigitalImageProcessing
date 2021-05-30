A = double(A);

[M,N] = size(A);

Ac = zeros(M,N);
for i=1:M
    for j=1:N
        Ac(i,j) = (-1).^(i+j);
    end
end

Z = immultiply(A,Ac);

figure
ip_disp(A)

figure
ip_disp(Z)