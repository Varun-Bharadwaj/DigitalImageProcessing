%% Sinusoidal
% Create a 256 X 256 image that consists of a horizontal sinusoid, 
% with the same period and intensity
% max/min as the black and white bar pattern. 
% A horizontal sinusoid varies only along the horizontal
% axis; it has a constant value along the vertical axis, 
% in a similar fashion to the vertical bars described
% above.
%% 
B=zeros(256); % 256x256 matrix filled with zeros

%% 

% sin(2*pi*f*t) is the general format
% f=1/32
% 2*pi*f=0.1963
%% 

for i=1:256
    for j=1:256
        B(i,j)=-sin(0.1963*j); % Generating a sine wave and storing its values in a matrix
    end
end
%% 
        
B=B+1;  % range 0 to 2
B=127.5*B;  % range 0 to 255
%% 

figure
image([0 255],[0 255],B) % display
axis ij 
axis equal
axis tight
colormap(gray(256)) % grayscale