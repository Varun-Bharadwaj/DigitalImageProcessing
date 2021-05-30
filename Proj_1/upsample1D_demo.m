function upsample1D_demo()
% upsample1D_demo()
%
% Demonstrates expansion (upsampling) with interpolation
% by an FIR lowpass filter.
% The signal is a 3000 Hz sinusoid, sampled at 12000 Hz.
% Thus the normalized frequency of the signal is 0.5pi.
%
% There will be "image frequencies" at 15000 Hz, etc.,...
%
% The signal is upsampled by a factor of 2, so the new Fs is 24 kHz,
% and the "new" normalized frequency is thus 0.25pi.
%
% Without any fitering, false images now show up at 9000 Hz, etc.
%
% Uses SP Toolbox routines for FIR filter design
% 
% Copyright (c) 1999-2020 Cameron H. G. Wright


N=4096;        % number of original samples
Fo=3000;			% frequency of the sinusoidal signal
Fh=3400;			% highest frequency of interest for LPF passband
Fs=12000;			% original sample frequency
Fpi=Fs/2;		% wrap-around frequency
Ts=1/Fs;			% original sampling period
L=2;				% upsampling factor
N2=N*L;         % new length after inserting zeros
FN=100;			% default order of the LPF
PB=Fh/Fpi; 		% normalized passband edge of FIR filter to include Fh
dp=0.01;			% ripple in the passband: 20*log10(1+dp)
ds=0.0001;		% attenuation in the stopband: 20*log10(ds)
n=0:N-1;			% discrete time index vector before upsampling
n2=0:N2-1;		% discrete time index vector after upsampling

x=sin(2*pi*Fo*n*Ts);  % generate the sinusoidal signal

% insert zeros into original signal
y=zeros(1,N2);	% create a vector of all zeros
y(1:L:N2)=x;   % put samples from x properly on to y 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pick a method to create the FIR filter coefficients appropriate for L
% all frequencies are normalized and expressed in pi units

% window method (hamming)
%b=fir2(FN,[0 PB/L 1/L 1],[1 1 0 0]);   

% window method (kaiser)
%[FN,Wn,beta,typ] = kaiserord([PB/L 1/L], [1 0], [dp ds]);
%b=fir1(FN, Wn, typ, kaiser(FN+1,8));
%b=fir2(FN,[0 PB/L 1/L 1],[1 1 0 0],kaiser(FN+1,8)); 

% least squares method
%b=firls(FN,[0 PB/L 1/L 1],[1 1 0 0]);  

% equiripple (Parks-McLelllan method)
[FN,fo,ao,w] = remezord( [PB/L 1/L], [1 0], [dp ds]);
b = remez(FN,fo,ao,w);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% filter the upsampled data with FIR interpolation filter
% filtfilt has minimal startup transients
yFIR=filtfilt(b,1,y);  
a=max(abs(yFIR));
yFIR=yFIR/a;   % scale to compensate for filter gain


% set some plotting limits
if (N > 10) NP=10; end
N2P=(NP*L)-(L-1);
xmax=max(x)*1.1; xmin=min(x)*1.1;

close all
fig=0;

% create plots
fig=fig+1;
figure(fig)
subplot(2,1,1)
stem(n(1:NP),x(1:NP))
axis([0 NP-1 xmin xmax])
title('Original signal (first 10 samples)')
subplot(2,1,2)
stem(n2(1:N2P),y(1:N2P))
axis([0 N2P-1 xmin xmax])
title('Effect of just inserting zeros')

fig=fig+1;
figure(fig)
subplot(2,1,1)
pwelch(x,[],[],[],Fs)
title('Original pwelch')
ylabel('Magnitude (dB)')
subplot(2,1,2)
pwelch(y,[],[],[],Fs*L)
title('pwelch after just inserting zeros')
ylabel('Magnitude (dB)')

% fig=fig+1;
% figure(fig)
% subplot(2,1,1)
% pwelch(x);
% title('Original pwelch')
% ylabel('Magnitude (dB)')
% xlabel('Normalized Frequency (pi units)')
% subplot(2,1,2)
% pwelch(y);
% title('pwelch after just inserting zeros')
% ylabel('Magnitude (dB)')
% xlabel('Normalized Frequency (pi units)')

fig=fig+1;
figure(fig)
subplot(2,1,1)
[H,F]=freqz(b,1,1024,Fs*L);
plot(F,20*log10(abs(H)))
xlabel('Frequency')
grid on
axis([0 Fs*L/2 -120 10])
title(['Frequency response of FIR interpolator (',num2str(FN),' order)'])
ylabel('Magnitude (dB)')
subplot(2,1,2)
pwelch(yFIR,[],[],[],Fs*L)
title('pwelch after inserting zeros and FIR interpolation with scaling')
ylabel('Magnitude (dB)')

fig=fig+1;
figure(fig)
subplot(3,1,1)
stem(n(1:NP),x(1:NP))
axis([0 NP-1 xmin xmax])
title('Original signal (first 10 samples)')
subplot(3,1,2)
stem(n2(1:N2P),y(1:N2P))
axis([0 N2P-1 xmin xmax])
title('Effect of just inserting zeros')
subplot(3,1,3)
stem(n2(1:N2P),yFIR(1:N2P))
axis([0 N2P-1 xmin xmax])
title('Effect of inserting zeros and FIR interpolation with scaling')

figure(1)
