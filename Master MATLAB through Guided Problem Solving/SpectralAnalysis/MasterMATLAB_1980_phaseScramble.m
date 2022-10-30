%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Spectral analysis
%      VIDEO: Phase-scramble narrowband time series
% Instructor: mikexcohen.com
%
%%


% parameters
srate = 600;  % sampling rate in Hz
npnts = srate*2; % number of time and frequency points
time  =  % time vector

% create frequencies vector (using trick of going beyond Nyquist)
hz = linspace(0,srate,npnts);

% parameters for frequency-domain Gaussian
fwhm  = 5;  % fwhm in Hz
peakf = 13; % peak frequency of Gaussian, in Hz

% create Gaussian
s  = ; % normalized width
x  = ;             % shifted frequencies
fx = ;    % the Gaussian


% signal is ifft of gaussian times random noise
signal = 

% compute the Fourier transform of the signal
signalX = 

% shuffle the phases
phases = angle( 

% create a new Fourier series as ae^{ip}
shuffdata = 

% reconstruct the signal from the Fourier series
shuffsig = 


% plot both time series
figure(1), clf
subplot(211), hold on
plot(time,,'k','linew',2)
plot(time,,'r.')
legend({'Original';'Shuffled'})
xlabel('Time (sec.)'), ylabel('Amplitude')
title('Time domain')


% compute power spectra
signalPow = abs( 
shuffPow  = abs( fft(

% vector of frequencies
hz = linspace(0,,floor(npnts/2)+1);

% plot the power spectra
subplot(212)
plot(hz,signalPow(1:length(hz)),'k','linew',2), hold on
plot(shuffPow(1:length(hz)),'ro','markerfacecolor','r')
set(gca,'xlim',[0 peakf*2])
xlabel('Frequency (Hz)')
title('Frequency domain')

%%
