%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Time series analysis
%      VIDEO: Narrow-band filter via frequency-domain Gaussian
% Instructor: mikexcohen.com
%
%%

% generate broadband signal
srate  = 512; % Hz
time   = ; % create 5 seconds of data using this sampling rate
npnts  = length(time);
signal = randn(npnts,1);



% create frequency-domain filter
fwhm  = 4; % full-width at half-maximum, in Hz
peakf = 8; % peak frequency, also in Hz

% frequencies (up to srate is a programming trick)
hz = linspace(0,srate,npnts)';

% create Gaussian
s  = ; % normalized width
x  = ;             % shifted frequencies
fx = ;    % gaussian

% filter the signal via circular convolution
filtdat = 


%% bonus: compute empirical peak and FWHM
fidx  = 
fwhmX = 
% empirical FWHM
empfwhm = 

% also get the empirical peak frequency
emppeak = 

%%


% now for some plotting
figure(1),clf

% plot the original and filtered signals
subplot(211), hold on
plot(time,signal);
set(h,'color',[1 1 1]*.7)
plot(,,'r','linew',2)
xlabel('Time (s)'), ylabel('Amplitude gain')
title('Signals in time domain')


% now plot the spectral response of the filter
subplot(212), hold on
plot(hz,,'ko-','markersize',6,'markerfacecolor','y')
set(gca,'xlim',[max(peakf-10,0) peakf+20]);
xlabel('Frequency (Hz)'), ylabel('Amplitude gain')

% bonus: draw a dashed line at 50% gain
plot(

% title([ 'Requested: ' num2str(peakf) ', ' num2str(fwhm) ' Hz; Empirical: ' num2str(emppeak) ', ' num2str(empfwhm) ' Hz' ])

%%
