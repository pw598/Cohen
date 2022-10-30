%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Time series analysis
%      VIDEO: Create a "chirp" (FM signal)
% Instructor: mikexcohen.com
%
%%

% details, details
srate = 1000;
time  = 0:1/srate:5;
pnts  = length(time);

hz = linspace(0,srate/2,floor(pnts/2)-1);

% frequency range for dipolar chirp
f  = [5 15]; % in Hz

% dipolar frequency formula
ff = 
signal = 

% compute its "static" power spectrum
chirppow = abs((signal)/pnts).^2;

% compute instantaneous frequency
phaseangles = 
instfreq = 


% plot signal
figure(1), clf
subplot(311)
plot(time,signal,'linew',2)
xlabel('Time (s)'), ylabel('Amplitude')
title('Chirp signal')

% plot power spectrum
subplot(312)
plot(hz,,'s-','linew',2)
set(gca,'xlim',
xlabel('Frequency (Hz)'), ylabel('Power')
title('Power spectrum of chirp')



% plot the theoretical instantaneous frequency
subplot(313), hold on
plot(,,'r','linew',2)

% and the empirical one on top
plot(,,'linew',2)
xlabel('Time (sec.)'), ylabel('Frequency (Hz)')
title('Frequency time series (FM)')
legend({'Specified';'Empirical'})

%% adaptation for multipolar formula

% multipolar frequency formula
freqmod = exp(-time.^2)*10+10;
signal  = 


% compute its "static" power spectrum
chirppow = fft(signal)/pnts;

% compute instantaneous frequency
phaseangles = 
instfreq = diff(

% plot signal
figure(2), clf
subplot(311)
plot(time,signal,'linew',2)
xlabel('Time (s)'), ylabel('Amplitude')
title('Chirp signal')

% plot power spectrum
subplot(312)
plot(hz,chirppow,'s-','linew',2)
set(gca,'xlim',[0 f(2)+10])
xlabel('Frequency (Hz)'), ylabel('Power')
title('Power spectrum of chirp')

% plot instantaneous frequency
subplot(313), hold on
plot(time,freqmod,'r','linew',2)
plot(time,instfreq,'linew',2)
set(gca,'ylim',[0 max(freqmod)+10])
xlabel('Time (sec.)'), ylabel('Frequency (Hz)')
title('Frequency time series (FM)')
legend({'Specified';'Empirical'})

%%
