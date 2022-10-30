%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Time series analysis
%      VIDEO: Time frequency analysis via wavelet convolution
% Instructor: mikexcohen.com
%
%%

% create signal
srate = 1000;
time  = -3:1/srate:3;
pnts  = length(time);
freqmod = exp(-time.^2)*10+10;
freqmod = % add linear trend
signal  = % compute signal based on instantaneous frequency modulation


% frequencies for TF analysis
nfrex = 50; % 50 frequencies
frex  = linspace(3,35,);

% initialize matrices for wavelet and time-frequency results
[wavelets,tf] = deal( zeros(,) );

% create complex Morlet wavelet family
for wi=1:nfrex
    % width of Gaussian (number of cycles = 13)
    s = 
    % create complex wavelet
    wavelets(wi,:) = 
end

% create an image of the wavelets
figure(1), clf
contourf(,,,40,'linecolor','none')
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('Real part of wavelets')


% convolution per frequency
for fi=1:nfrex
    
    % convolution
    convres = 
    
    % extract power from complex signal
    tf(fi,:) = convres
end
    
% plot the time-domain signal
figure(2)
subplot(411)
plot(time,signal,'linew',1)
xlabel('Time (s)')
title('Time-domain signal')

% plot the time-frequency response
subplot(4,1,[2 3 4])
contourf(
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('time-frequency power')

%%
