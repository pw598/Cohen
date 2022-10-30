%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Spectral analysis
%      VIDEO: Power spectrum from FFT and Welch's method
% Instructor: mikexcohen.com
%
%%

%% the signal created in a previous video...

srate = 1000; % sampling rate in Hz
time  = -2:1/srate:2;
frex  = [ 5 7 15 16 30 ]; % frequencies in Hz
ampl  = [ 8 4 10  3  7 ]; % frequencies in Hz

% initialize signal
signal = zeros(1,length(time));

for fi=1:length(frex)
    AM = ampl(fi)*interp1(randn(20,1),linspace(1,20,length(time)),'pchip');
    signal = signal + AM.*sin(2*pi*frex(fi)*time);
end

%% "static" power spectrum from FFT

% vector of frequencies
hz = 

% compute signal power
sigpower = (fft()/).^2;

% plot the power spectrum
figure(1), clf
subplot(211)
plot(hz,sigpower,'k','linew',2)
set(gca,'xlim',[0 ])
xlabel('Frequency (Hz)'), ylabel('Power')
title('Power spectrum from FFT')

% show dashed vertical lines with simulated frequencies
% bonus: do this in one line of code!
hold on
plot(

%% Welch's method

% window length in time points (also ms if srate==1000)
winlength = 1000;

% window onset times
winonsets = round(linspace(,,50));

% note: different-length signal needs a different-length Hz vector
hzW = linspace(


% initialize the power matrix (windows x frequencies)
sigpower2 = zeros(length(winonsets),length(hzW));

% loop over frequencies
for wi=1:length(winonsets)
    
    % get a chunk of data from this time window
    datachunk = signal(
    
    % compute its power
    tmppow = abs(fft()/).^2;
    
    % enter into matrix
    sigpower2(wi,:) = tmppw(1:length(hzW));
end


% plot the power spectrum
subplot(212), cla
plot(hzW,sigpower2,'k','linew',2)
set(gca,'xlim',[0 max(frex)*3])
xlabel('Frequency (Hz)'), ylabel('Power')
title('Power spectrum from Welch''s method')

% show dashed vertical lines with simulated frequencies
% do it in one line for bonus!
hold on

%%
