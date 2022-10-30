%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Spectral analysis
%      VIDEO: Spectrogram of bird call
% Instructor: mikexcohen.com
%
%%

% load in birdcall (source: https://www.xeno-canto.org/403881)
[bc,fs] = audioread('XC403881.mp3');

% let's hear it!
soundsc(bc,fs)


% create a time vector based on the data sampling rate
n = 
timevec = 

% plot the data from the two channels
figure(1), clf
subplot(211)
plot(timevec,bc)
xlabel('Time (sec.)')
title('Time domain')
set(gca,'ytick',[],'xlim',timevec([1 end]))

% compute the power spectrum
hz = linspace(0,,);
bcpow = abs(fft( detrend(bc(:,2)) )/n).^2;

% now plot it
subplot(212)
plot(hz,bcpow(1:length(hz)),'linew',2)
xlabel('Frequency (Hz)')
title('Frequency domain')
set(gca,'xlim',[0 8000])

%% now for a time-frequency analysis

% use MATLAB's spectrogram function (in the signal processing toolbox)
[powspect,frex,time] = spectrogram(detrend(bc(:,2)),hann(1000),100,[],fs);


% show the time-frequency power plot
figure(2), clf
imagesc(time,frex,)
axis xy
set(gca,'clim',[-1 1]*5,'ylim',frex([1 dsearchn(frex,15000)]),'xlim',time([1 end]))
xlabel('Time (sec.)'), ylabel('Frequency (Hz)')
colormap hot

%% bonus: compare "static" and "dynamic" spectra

% compare spectra from FFT vs. summed spectrogram (Welch's method)
figure(3), clf
subplot(211), hold on
plot(hz,,'linew',2)
plot(frex,abs(powspect).^2,'r','linew',3)
xlabel('Frequency (Hz)')
title('Frequency domain')
set(gca,'xlim',[0 8000])
legend({'FFT power';'\Sigma spectrogram'})


% compare root-mean-square vs. summed spectrogram (spectral energy)
subplot(212), hold on
plot(timevec,)
plot(time,,'linew',3)
xlabel('Time (sec.)')
title('Time domain')
set(gca,'xlim',time([1 end]))
legend({'RMS';'\Sigma spectrogram'})


%%
