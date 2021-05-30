
 x=1:256; y=x; % useful for mesh plotting purposes
 A=zeros(256);
 B=zeros(256);

 %Define each circle as the x and y positions squares that are less than the radius of the circle squared. (I had to look up how to calculate this) then equate the circle to the grayscale color wanted. 
 
%Create the 256x256 grid that will make up the image
[columns, rows] = meshgrid(1 : 256, 1 : 256);
%designate the middle of the square, this is where the circle's middle will
%be.
middle = 128;

%These are the actual funcitons that produce the circles form the
%parameters. Note that "A" is the small white circle, who's radius is 32
%pixels and set to color 255 (white). "B" is the large circle of radius 64
%set to color 128 (mid-point between black and white). Define each circle 
%as the x and y positions squares that are less than the radius of the circle squared.
%(I had to look up how to calculate this) then equate the circle to the grayscale color wanted. 

 A(power((rows - middle),2)+power((columns - middle),2)<= power(32,2))=255;
 B(power((rows - middle),2)+power((columns - middle),2)<= power(64,2))=128;
 %Combine the two 
 S=A+B; 
 
figure(1)
image([0 256],[0 256],S)%compile the image
axis ij  % put 0,0 in UL corner
axis equal
axis tight
colormap(gray(256)) % a 256 level (8-bit) grayscale
title('Concentric Disks')