function ip_dispsc(A)
% simplified routine to display 8-bit gray scale images
% scales image to full range of display
% Syntax: ip_dispsc(A) 
% where A is an image matrix, typically uint8
% This is similar to using imagesc
%
% Copyright 2004-2008 Cameron H. G. Wright


L=256;
L1=L-1;
A=double(A); % just in case
minA=min(min(A));
A=A-minA; % shift
maxA=max(max(A));
if maxA~=0
    A=A*L1/maxA; % compress or expand
end
[X Y]=size(A);
% switch X and Y for image coordinates
image(0:Y-1,0:X-1,A)
axis ij
axis equal
axis tight
colormap(gray(L))
