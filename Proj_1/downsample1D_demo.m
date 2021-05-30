function downsample1D_demo()
% downsample1D_demo()
%
% Demonstrates decimation (downsampling) with antialiasing
% using an FIR lowpass filter.
% The signal is a sum of sinusoids with frequencies at
% 3 kHz and 7 kHz, sampled at 24 kHz.
% The frequency of interest is at 3 kHz. Thus the normalized 
% frequency of interest is at 0.25pi. We don't care about
% the 7 kHz frequency for this application.
%
% The signal is downsampled by a factor of 2, so the new Fs is 12 kHz,
% and thus the "new" normalized frequency of the
% signal of interest will be 0.5pi.
%
% Uses SP Toolbox routines for FIR filter design
%
% Note this is *NOT* an efficient way to do this--use polyphase filters
% 
% Copyright (c) 1999-2020 Cameron H. G. Wright

N1=4096;       % number of original samples
F1=3000;			% a frequency component of the signal
F2=7000;			% a frequency component of the signal
Fh=3600;		   % highest frequency of interest for LPF passband
Fs=24000;		% original sample frequency
Fpi=Fs/2;		% wrap-around frequency
Ts=1/Fs;			% original sampling period
M=2;				% downsampling factor
N2=ceil(N1/M); % new length after downsampling
FN=100;			% default order of the LPF
SB=Fpi/M;		% stopband edge of FIR filter
PB=Fh/SB; 		% normalized passband edge of FIR filter to include Fh
dp=0.01;			% ripple in the passband: 20*log10(1+dp)
ds=0.0001;		% attenuation in the stopband: 20*log10(ds)
n1=0:N1-1;		% discrete time index vector before downsampling
n2=0:N2-1;		% discrete time index vector after downsampling

% generate the signal
x=sin(2*pi*F1*n1*Ts)+sin(2*pi*F2*n1*Ts);  

% remove samples from original signal without antialias filtering
yalias=x(1:M:N1);	% skip samples by a factor of M

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pick a method to create the FIR filter coefficients appropriate for M
% all frequencies are normalized and expressed in pi units

% window method (hamming)
%b=fir2(FN,[0 PB/M 1/M 1],[1 1 0 0]);   

% window method (kaiser)
%FN=kaiserord( [PB/M 1/M], [1 0], [0.1 0.0001] ); % calculate needed order
%b=fir2(FN,[0 PB/M 1/M 1],[1 1 0 0],kaiser(FN+1,8)); 

% least squares method
%b=firls(FN,[0 PB/M 1/M 1],[1 1 0 0]);  

% equiripple (Parks-McLelllan method)
FStop=(Fs/2)/M; % set stopband edge to pi/M
[FN,fo,ao,w] = remezord( [Fh FStop], [1 0], [dp ds], Fs );
b = remez(FN,fo,ao,w);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% filter the original data with FIR antialiasing filter
% filtfilt has minimal startup transients
yFIR=filtfilt(b,1,x);  
a=max(abs(yFIR));
yFIR=yFIR/a;   % scale to compensate for filter gain

% remove samples from filtered signal 
y=yFIR(1:M:N1);	% skip samples with step size M



% set some plotting limits
if (N2 > 10) N2P=10; end
N1P=(N2P*M)-(M-1);
xmax=max(x)*1.1; xmin=min(x)*1.1;

% create plots
close all
fig=0;

fig=fig+1;
figure(fig)
subplot(2,1,1)
stem(n1(1:N1P),x(1:N1P))
axis([0 N1P-1 xmin xmax])
title(['Original signal (first ',num2str(N1P),' samples)'])
subplot(2,1,2)
stem(n2(1:N2P),yalias(1:N2P))
axis([0 N2P-1 xmin xmax])
title('Effect of just removing samples')

fig=fig+1;
figure(fig)
subplot(2,1,1)
pwelch(x,[],[],[],Fs)
title('Original pwelch')
ylabel('Magnitude (dB)')
subplot(2,1,2)
pwelch(yalias,[],[],[],Fs/M)
title('pwelch after just removing samples')
ylabel('Magnitude (dB)')

% fig=fig+1;
% figure(fig)
% subplot(2,1,1)
% pwelch(x);
% title('Original pwelch')
% ylabel('Magnitude (dB)')
% xlabel('Normalized Frequency (pi units)')
% subplot(2,1,2)
% pwelch(yalias);
% title('pwelch after just removing samples')
% ylabel('Magnitude (dB)')
% xlabel('Normalized Frequency (pi units)')

fig=fig+1;
figure(fig)
subplot(2,1,1)
[H,F]=freqz(b,1,1024,Fs);
plot(F,20*log10(abs(H)))
xlabel('Frequency')
grid on
axis([0 Fs/2 -100 10])
title(['Frequency response of FIR filter (',num2str(FN),' order)'])
ylabel('Magnitude (dB)')
subplot(2,1,2)
pwelch(x,[],[],[],Fs)
title('Original pwelch')
ylabel('Magnitude (dB)')

% fig=fig+1;
% figure(fig)
% subplot(2,1,1)
% [H,W]=freqz(b,1,1024);
% plot(W/pi,20*log10(abs(H)))
% xlabel('Normalized Frequency (pi units)')
% grid on
% axis([0 1 -100 10])
% title(['Frequency response of FIR filter (',num2str(FN),' order)'])
% ylabel('Magnitude (dB)')
% subplot(2,1,2)
% pwelch(x)
% title('Original pwelch')
% ylabel('Magnitude (dB)')
% xlabel('Normalized Frequency (pi units)')

fig=fig+1;
figure(fig)
subplot(2,1,1)
pwelch(yalias,[],[],[],Fs/M)
title('Downsampled pwelch with no filtering: aliasing')
ylabel('Magnitude (dB)')
subplot(2,1,2)
pwelch(y,[],[],[],Fs/M)
title('Downsampled pwelch with filtering: no aliasing')
ylabel('Magnitude (dB)')

% fig=fig+1;
% figure(fig)
% subplot(2,1,1)
% pwelch(yalias)
% title('Downsampled pwelch with no filtering: aliasing')
% ylabel('Magnitude (dB)')
% xlabel('Normalized Frequency (pi units)')
% subplot(2,1,2)
% pwelch(y)
% title('Downsampled pwelch with filtering: no aliasing')
% ylabel('Magnitude (dB)')
% xlabel('Normalized Frequency (pi units)')

figure(1)
