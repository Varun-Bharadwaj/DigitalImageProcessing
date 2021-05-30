function Z  = ib_shift(X)
X = double(X);
Xf = fft2(X);
[U,V] = size(Xf);
for i=1:U
    for j=1:V
        Xf(i,j) = Xf(i,j).*((-1)^(i+j));
    end
end
Z = ifft2(Xf);