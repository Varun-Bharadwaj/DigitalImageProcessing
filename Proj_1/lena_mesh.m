function lena_mesh()
% Simple m-file to manipulate the grayscale Lena image
% to show how an image can be thought of as a 3-D surface.
% Assumes "lena.mat" is in the current directory.
% 
% This m-file is for demonstration purposes only;
% no error checking is used.
%
% Copyright (c) 2007-2014 Cameron H. G. Wright

close all

load lena;

A=double(A512);


Af=flipud(A);

figure(1)  % standard image
ip_disp(A);

figure(2)  % 3-D plot
mesh(Af);
colormap gray
axis image
view(3)  % sets a standard 3-D view

figure(3)  % 1-D slice
plot(A(100,:))
axis tight
title('One slice at row = 100')

figure(4)
ip_disp(Af);
figure(1)
