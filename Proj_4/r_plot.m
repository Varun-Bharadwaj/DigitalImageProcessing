% Gaussian Low Pass Filter

[H,D] = ib_glpf(A,5); % Filter function for radii 5
[H1,D1] = ib_glpf(A,15); % Filter function for radii 15
[H2,D2] = ib_glpf(A,30); % Filter function for radii 30
[H3,D3] = ib_glpf(A,80); % Filter function for radii 80
[H4,D4] = ib_glpf(A,100); % Filter function for radii 100

figure
plot(D(:),H(:))
hold on
plot(D1(:),H1(:))
plot(D2(:),H2(:))
plot(D3(:),H3(:))
plot(D4(:),H4(:))
xlabel('D(u,v)')
ylabel('H(u,v)')
title('GLPF radial cross sections for different radii')
legend('R=5','R=15','R=30','R=80','R=100')
print('GLPF radial cross sections for different radii','-djpeg')
hold off

% Gaussian High Pass Filter

[H,D] = ib_ghpf(A,5); % Radii 5
[H1,D1] = ib_ghpf(A,15); % Filter function for radii 15
[H2,D2] = ib_ghpf(A,30); % Filter function for radii 30
[H3,D3] = ib_ghpf(A,80); % Filter function for radii 80
[H4,D4] = ib_ghpf(A,100); % Filter function for radii 100

figure
plot(D(:),H(:))
hold on
plot(D1(:),H1(:))
plot(D2(:),H2(:))
plot(D3(:),H3(:))
plot(D4(:),H4(:))
xlabel('D(u,v)')
ylabel('H(u,v)')
title('GHPF radial cross sections for different radii')
legend('R=5','R=15','R=30','R=80','R=100')
print('GHPF radial cross sections for different radii','-djpeg')
hold off